//
//  HistoryDetailViewModel.swift
//  MVVM_TestsTests
//
//  Created by 조상현 on 2022/10/07.
//

import XCTest
@testable import MVVM_Tests

final class HistoryDetailViewModelTests: XCTestCase {
    
    var viewModel: HistoryDetailViewModel!
    
    override func setUpWithError() throws {
        viewModel = HistoryDetailViewModel(networkManager: MockNetworkManager(mockData: MockData.MATCH_INFO))
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testGetHistoryDetailData_WhenNetworkingSuccess_ShouldReturnTrue() {
        viewModel.getData(matchId: "")
        XCTAssertTrue(viewModel.isHistoryDetail)
    }
    
}
