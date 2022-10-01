//
//  LoadingView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/10/01.
//

import SwiftUI

struct LoadingView: View {
    
    @StateObject var loadingSingleton = LoadingSingleton.shared
    
}

extension LoadingView {
    
    var body: some View {
        VStack {
            if loadingSingleton.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.yellow)
            }
        }
    }
    
}
