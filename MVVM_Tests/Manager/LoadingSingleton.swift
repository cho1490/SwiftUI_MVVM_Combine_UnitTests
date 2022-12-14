//
//  LoadingSingleton.swift
//  MVVM_Tests
//
//  Created by ์กฐ์ํ on 2022/09/22.
//

import Combine

class LoadingSingleton: ObservableObject {
    
    static let shared = LoadingSingleton()
    @Published var isLoading = false
    
    private init() { }
    
    func loading() {
        isLoading = true
    }
    
    func complete() {

        isLoading = false
    }
    
}
