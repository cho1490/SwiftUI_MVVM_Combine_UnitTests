//
//  BaseViewModel.swift
//  MVVM_Tests
//
//  Created by ์กฐ์ํ on 2022/09/22.
//

import Combine

class BaseViewModel: ObservableObject {

    let loadingSingleton = LoadingSingleton.shared
    let toastSingleton = ToastSingleton.shared
    
    // Auto cancel when deinit
    var cancellables = Set<AnyCancellable>()
        
}
