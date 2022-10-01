//
//  LoadingSingleton.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/22.
//

import Combine

class LoadingSingleton: ObservableObject {
    
    static let shared = LoadingSingleton()
    @Published var isLoading = false
    
    private init() { }
    
    func loading() {
        print("loading!!")
        isLoading = true
    }
    
    func complete() {
        print("complete!!")
        isLoading = false
    }
    
}
