//
//  HistroyView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/18.
//

import SwiftUI

struct HistoryView: View {
    
    @StateObject var viewModel = HistoryViewModel()
    
    var user: User
            
}

extension HistoryView {
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.history, id: \.self) { value in
                        NavigationLink(destination: HistoryDetailView()) {
                            
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
//            viewModel.getData(puuid: "")
        }
    }
    
}
