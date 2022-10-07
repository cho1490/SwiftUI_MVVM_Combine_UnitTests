//
//  HistoryViewModelTests.swift
//  MVVM_TestsTests
//
//  Created by 조상현 on 2022/10/07.
//

import XCTest
@testable import MVVM_Tests

class HistoryViewModelTests: XCTestCase {

    var viewModel: HistoryViewModel!
    
    override func setUpWithError() throws {
        viewModel = HistoryViewModel(networkManager: MockNetworkManager(mockData: MockData.MATCH_LIST))
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
        
    func testGetHistoryData_WhenNetworkingSuccess_ShouldReturnTrue() {
        viewModel.getData(puuid: "")        
        XCTAssertTrue(viewModel.isHistory)
    }

}
