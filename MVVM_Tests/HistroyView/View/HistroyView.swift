//
//  HistroyView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/18.
//

import SwiftUI

struct HistoryView: View {
    
    @ObservedObject var viewModel = HistoryViewModel()
    
    var body: some View {
        VStack {
            
        }
        .padding()
        .onAppear {
            viewModel.getData(puuid: "")
        }
    }
    
}
