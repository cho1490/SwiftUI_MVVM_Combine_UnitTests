//
//  View.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/10/01.
//

import SwiftUI

extension View {
    
    @ViewBuilder
    func makeMoreView() -> some View {
        ZStack {
            self
            
            LoadingView()
            
            ToastView()
        }
    }
    
}
