//
//  HomeViewModelTest.swift
//  MVVM_TestsTests
//
//  Created by 조상현 on 2022/10/02.
//

import XCTest
@testable import MVVM_Tests

class HomeViewModelTests: XCTestCase {
   
    var mockViewModel: HomeViewModel!
    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        mockViewModel = HomeViewModel(networkManager: MockNetworkManager(mockData: MockData.USER))
        viewModel = HomeViewModel(networkManager: NetworkManager())
    }
    
    override func tearDownWithError() throws {
        mockViewModel = nil
    }
            
    func testGetMockData_WhenMockDataDecoded_ShouldReturnTrue() {
        mockViewModel.getData()
        XCTAssertTrue(mockViewModel.isUser)
    }
    
    func testGetData_WhenNetworkingSuccess_ShouldReturnTrue() {
        let expectation = XCTestExpectation(description: "fetches data and updates properties.")
        
        viewModel.summonerName = "Deepredk"
        viewModel.getData()
        
        let asyncWaitDuration = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
            expectation.fulfill()
            
            XCTAssertTrue(self.viewModel.isUser)
        }
        
        wait(for: [expectation], timeout: asyncWaitDuration)    
    }
    
}
