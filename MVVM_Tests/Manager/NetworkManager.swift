//
//  Manager.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Foundation
import Combine

enum EndPoint: String {
    case flight
    case detail
}

enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    // Combine AnyCancellable
    // A type-erasing cancellable object that executes a provided closure when canceled.
    private var cancellables = Set<AnyCancellable>()
    private let baseUrl = ""
    
    // Combine Future -> final public class Future<Output, Failure> : Publisher where Failure : Error
    /*
     Publisher 를 conform 하기에 promise 클로저가 존재함 ->
     Future<T, Never>.init { (@escaping Future<T, Never>.promise) in
        // code
     }
     */
    func getData<T: Decodable>(endPoint: EndPoint, id: Int? = nil, type: T.Type) -> Future<[T], Error> {
        return Future<[T], Error> { [weak self] promise in
            guard let self = self, let url = URL(string: self.baseUrl.appending(endPoint.rawValue).appending(id == nil ? "" : "/\(id ?? 0)")) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            print("URL is \(url.absoluteString)")
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap{ (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    return data
                }
                .decode(type: [T].self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { (completion) in
                    if case let .failure(error) = completion {
                        switch error {
                        case let decodingError as DecodingError:
                            promise(.failure(decodingError))
                        case let apiError as NetworkError:
                            promise(.failure(apiError))
                        default:
                            promise(.failure(NetworkError.unknown))
                        }
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
    
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "Invalid URL")
        case .responseError:
            return NSLocalizedString("Unexpected status code", comment: "Invalid response")
        case .unknown:
            return NSLocalizedString("Unknown error", comment: "Unknown error")
        }
    }
}
