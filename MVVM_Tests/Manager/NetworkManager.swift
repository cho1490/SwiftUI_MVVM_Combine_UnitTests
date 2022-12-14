//
//  Manager.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Foundation
import Combine

enum StartPoint: String {
    case kr
    case asia
}

enum MiddlePoint: String {
    case summoner
    case match
}

enum MyError: Error {
    case urlEncoding
}
    
enum NetworkError: Error {
    case invalidURL
    case responseError
    case unknown
}

class NetworkManager: NetworkManagerDelegate {
            
    // Combine AnyCancellable
    // A type-erasing cancellable object that executes a provided closure when canceled.
    private var cancellables = Set<AnyCancellable>()
    
    // Combine Future -> final public class Future<Output, Failure> : Publisher where Failure : Error
    /*
     Publisher 를 conform 하기에 promise 클로저가 존재함 ->
     Future<T, Never>.init { (@escaping Future<T, Never>.promise) in
        // code
     }
     */
    func getSingleData<T: Decodable>(startPoint: StartPoint, middlePoint: MiddlePoint, endPoint: String, parameters: [String: String]?, type: T.Type) -> Future<T, Error> {
        return Future<T, Error> { [weak self] promise in
            var urlString = "https://\(startPoint.rawValue).api.riotgames.com/lol/\(middlePoint.rawValue)/\(endPoint)"
            
            if let p = parameters {
                if !p.isEmpty {
                    urlString += "?"
                    for param in p {
                        urlString += "\(param.key)=\(param.value)&"
                    }
                    
                    if urlString.last == "&" {
                        urlString.removeLast()
                    }
                }
            }
            
            guard let self = self, let url = URL(string: urlString) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            var request = URLRequest(url: url)
            let session = URLSession.shared
            request.httpMethod = "GET"
            request.addValue(Define.KEY, forHTTPHeaderField: "X-Riot-Token")
            session.dataTaskPublisher(for: request)
                .tryMap { (data, response) -> Data in
                    print("Data :: \(String(decoding: data, as: UTF8.self))")
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.responseError
                    }
                    
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
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
        
        
        
        
    func getMultipleData<T: Decodable>(startPoint: StartPoint, middlePoint: MiddlePoint, endPoint: String, parameters: [String: String]?, type: T.Type) -> Future<[T], Error> {
        return Future<[T], Error> { [weak self] promise in
            var urlString = "https://\(startPoint.rawValue).api.riotgames.com/lol/\(middlePoint.rawValue)/\(endPoint)"
            
            if let p = parameters {
                if !p.isEmpty {
                    urlString += "?"
                    for param in p {
                        urlString += "\(param.key)=\(param.value)&"
                    }
                    
                    if urlString.last == "&" {
                        urlString.removeLast()
                    }
                }
            }
            
            guard let self = self, let url = URL(string: urlString) else {
                return promise(.failure(NetworkError.invalidURL))
            }
            
            var request = URLRequest(url: url)
            let session = URLSession.shared
            request.httpMethod = "GET"
            request.addValue(Define.KEY, forHTTPHeaderField: "X-Riot-Token")
            session.dataTaskPublisher(for: request)
                .tryMap { (data, response) -> Data in
                    print("Data :: \(String(decoding: data, as: UTF8.self))")
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

extension MyError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .urlEncoding:
            return NSLocalizedString("Url Encoding Failed", comment: "Url Encoding Failed")
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
