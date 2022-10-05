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
    
    func getSingleData<T>(startPoint: StartPoint, middlePoint: MiddlePoint, endPoint: String, parameters: [String : String]?, type: T.Type) -> Future<T, Error> where T : Decodable {
        return Future<T, Error> { [weak self] promise in
            do {
                if let user = try self?.decoder.decode(T.self, from: MockData.USER) {                    
                    promise(.success(user))
                }
            } catch {
                print("error : \(error.localizedDescription)")
                promise(.failure(error))
            }
        }
    }
    
    func getMultipleData<T>(startPoint: MVVM_Tests.StartPoint, middlePoint: MVVM_Tests.MiddlePoint, endPoint: String, parameters: [String : String]?, type: T.Type) -> Future<[T], Error> where T : Decodable {
        return Future<[T], Error> { promise in
        }
    }
    
    
    let decoder = JSONDecoder()

    
}

