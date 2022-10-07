//
//  HomeViewModelTest.swift
//  MVVM_TestsTests
//
//  Created by 조상현 on 2022/10/02.
//

import XCTest
@testable import MVVM_Tests

class HomeViewModelTests: XCTestCase {
   
    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        viewModel = HomeViewModel(networkManager: MockNetworkManager(mockData: MockData.USER))
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
        
    func testGetUserData_WhenNetworkingSuccess_ShouldReturnTrue() {
        viewModel.getData()
        XCTAssertTrue(viewModel.isUser)
    }
    
}
