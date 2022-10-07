//
//  MockService.swift
//  MVVM_TestsTests
//
//  Created by 조상현 on 2022/10/04.
//

import Foundation
import Combine
@testable import MVVM_Tests

class MockNetworkManager: NetworkManagerDelegate {
    
    let mockData: Data!
    
    init(mockData: Data) {
        self.mockData = mockData
    }
    
    func getSingleData<T>(startPoint: StartPoint, middlePoint: MiddlePoint, endPoint: String, parameters: [String : String]?, type: T.Type) -> Future<T, Error> where T : Decodable {
        return Future<T, Error> { [weak self] promise in
            do {
                if let mock = self?.mockData {
                    if let data = try self?.decoder.decode(T.self, from: mock) {
                        promise(.success(data))
                    }
                }
            } catch {
                print("error : \(error.localizedDescription)")
                promise(.failure(error))
            }
        }
    }
    
    func getMultipleData<T>(startPoint: MVVM_Tests.StartPoint, middlePoint: MVVM_Tests.MiddlePoint, endPoint: String, parameters: [String : String]?, type: T.Type) -> Future<[T], Error> where T : Decodable {
        return Future<[T], Error> { [weak self] promise in
            do {
                if let mock = self?.mockData {
                    if let data = try self?.decoder.decode([T].self, from: mock) {
                        promise(.success(data))
                    }
                }
            } catch {
                print("error : \(error.localizedDescription)")
                promise(.failure(error))
            }
        }
    }
    
    
    let decoder = JSONDecoder()

    
}

