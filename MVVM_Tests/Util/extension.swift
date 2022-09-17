//
//  extension.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Foundation

final class Box<T> {
    
    typealias Listener = (T) -> Void?
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    /*
     //View Model
     let flights = Box([Flight]())

     //View
     viewModel.flights.bind { [weak self] flights in
        // code
     }
     */
    
}


