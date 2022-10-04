//
//  MockService.swift
//  MVVM_TestsTests
//
//  Created by 조상현 on 2022/10/04.
//

import Foundation
import Combine
@testable import MVVM_Tests

class MockService {
    
    let decoder = JSONDecoder()
    
    func getUserData() -> Future<User, Error> {
        return Future<User, Error> { [weak self] promise in
            do {
                if let user = try self?.decoder.decode(User.self, from: MockData.USER) {
                    promise(.success(user))
                } else {
                    
                }
            } catch {
                promise(.failure(error))
            }
        }
    }
    
}
