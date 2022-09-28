//
//  ToastSingleton.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/28.
//

import Combine

class ToastSingleton: ObservableObject {
    
    static let shared = ToastSingleton()
    
    @Published var toastState: ToastState = .NONE
    var toastString: String = ""
    
    func setState(_ toastState: ToastState, _ toastString: String) {
        self.toastState = toastState
        self.toastString = toastString        
    }
    
    func resetState() {
        toastState = .NONE
        toastString = ""
    }
    
}

enum ToastState {
    case NONE
    case INFORMATION
    case ERROR
}
