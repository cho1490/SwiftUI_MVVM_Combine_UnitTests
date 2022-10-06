//
//  HomeViewModelTest.swift
//  MVVM_TestsTests
//
//  Created by 조상현 on 2022/10/02.
//

import XCTest
import SwiftUI
@testable import MVVM_Tests

class HomeViewModelTests: XCTestCase {
   
    var viewModel: HomeViewModel!
    
    override func setUp() {
        viewModel = HomeViewModel(networkManager: MockNetworkManager())
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func testGetUserData() {
        viewModel.getData()

        XCTAssertEqual(ToastState.INFORMATION, viewModel.toastSingleton.toastState)
        XCTAssertEqual(ToastState.ERROR, viewModel.toastSingleton.toastState)
        print(viewModel.toastSingleton.toastString)          
        
        XCTAssertNotNil(viewModel.user)
    }
    
}
