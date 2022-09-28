//
//  ContentView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()    
        
}

extension HomeView {

    var body: some View {
        NavigationStack {
            VStack {
                TextField("User Name", text: $viewModel.summonerName)
                
                Spacer()
                
                Button("Get Data") {
                    viewModel.getData()
                }
            }
            .padding()
        }
        .navigationDestination(isPresented: $viewModel.isUser) {
            if let user = viewModel.user {
                HistoryView(user: user)
            }
        }
    }
    
}
