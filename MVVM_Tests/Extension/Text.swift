//
//  Text.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/28.
//

import SwiftUI

extension Text {
    
    func makeToast(_ toastState: ToastState) -> some View {
        var color: Color = .white
        
        switch toastState {
        case .ERROR:
            color = .red
        case .INFORMATION:
            color = .green
        default:
            return AnyView(EmptyView())
        }
        
        return AnyView(
            self
                .padding(10)
                .multilineTextAlignment(.center)
                .background(.gray)
                .foregroundColor(color)
                .cornerRadius(10)
                .font(.system(size: 18))
            )
    }
                
}
