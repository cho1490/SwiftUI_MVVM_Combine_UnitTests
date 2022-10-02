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
    
    override func setUp() {
        viewModel = HomeViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func test1() {
        viewModel?.getData()
    }
    
}
