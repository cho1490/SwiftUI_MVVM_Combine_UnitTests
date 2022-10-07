//
//  HistoryViewModelTests.swift
//  MVVM_TestsTests
//
//  Created by 조상현 on 2022/10/07.
//

import XCTest
@testable import MVVM_Tests

class HistoryViewModelTests: XCTestCase {

    var mockViewModel: HistoryViewModel!
    var viewModel: HistoryViewModel!
    
    override func setUpWithError() throws {
        mockViewModel = HistoryViewModel(networkManager: MockNetworkManager(mockData: MockData.MATCH_LIST))
        viewModel = HistoryViewModel(networkManager: NetworkManager())
    }
    
    override func tearDownWithError() throws {
        mockViewModel = nil
    }
        
    func testGetMockData_WhenMockDataDecoded_ShouldReturnTrue() {
        mockViewModel.getData(puuid: "")        
        XCTAssertTrue(mockViewModel.isHistory)
    }

    func testGetData_WhenNetworkingSuccess_ShouldReturnTrue() {
        let expectation = XCTestExpectation(description: "fetches data and updates properties.")
        
        viewModel.getData(puuid: "w11f1vxwmiUdHj04AXcydzNyslacNNayFIGWdlA40GOMAYIJfHjbfQx4WfITz4caEHSM3klb-eEj0A")
        
        let asyncWaitDuration = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
            expectation.fulfill()
            
            XCTAssertTrue(self.viewModel.isHistory)
        }
        
        wait(for: [expectation], timeout: asyncWaitDuration)
    }
    
}
