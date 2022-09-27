//
//  BaseViewModel.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/22.
//

import Combine

class BaseViewModel: ObservableObject {

    let loadingSingleton = LoadingSingleton.shared
    
//     Auto cancel when deinit
    var cancellables = Set<AnyCancellable>()
    
}
