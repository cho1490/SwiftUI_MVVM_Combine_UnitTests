//
//  HistoryDetailViewModel.swift
//  MVVM_TestsTests
//
//  Created by 조상현 on 2022/10/07.
//

import XCTest
@testable import MVVM_Tests

final class HistoryDetailViewModelTests: XCTestCase {
    
    var mockViewModel: HistoryDetailViewModel!
    var viewModel: HistoryDetailViewModel!
    
    override func setUpWithError() throws {
        mockViewModel = HistoryDetailViewModel(networkManager: MockNetworkManager(mockData: MockData.MATCH_INFO))
        viewModel = HistoryDetailViewModel(networkManager: NetworkManager())
    }

    override func tearDownWithError() throws {
        mockViewModel = nil
        viewModel = nil
    }
    
    func testGetMockData_WhenMockDataDecoded_ShouldReturnTrue() {
        mockViewModel.getData(matchId: "")
        XCTAssertTrue(mockViewModel.isHistoryDetail)
    }
    
    func testGetData_WhenNetworkingSuccess_ShouldReturnTrue() {
        let expectation = XCTestExpectation(description: "fetches data and updates properties.")
        
        viewModel.getData(matchId: "KR_6134146931")
        
        let asyncWaitDuration = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + asyncWaitDuration) {
            expectation.fulfill()
            
            XCTAssertTrue(self.viewModel.isHistoryDetail)
        }
        
        wait(for: [expectation], timeout: asyncWaitDuration)
    }
    
}
