//
//  Text.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/28.
//

import SwiftUI

extension Text {
        
    @ViewBuilder
    func makeToast(_ toastState: ToastState) -> some View {
        switch toastState {
        case .ERROR:
            self
                .padding(10)
                .multilineTextAlignment(.center)
                .background(.gray)
                .foregroundColor(.red)
                .cornerRadius(10)
                .font(.system(size: 18))
        case .INFORMATION:
            self
                .padding(10)
                .multilineTextAlignment(.center)
                .background(.gray)
                .foregroundColor(.green)
                .cornerRadius(10)
                .font(.system(size: 18))
        case .NONE:
            EmptyView()
        }
    }
                
}
