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
            VStack {
                Text("Name : \(user.name)")
                
                Text("Level : \(user.summonerLevel)")
            }
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.history, id: \.self) { history in
                        NavigationLink(destination: HistoryDetailView(matchId: history)) {
                            VStack {
                                HStack {
                                    Text("MatchID : \(history)")
                                    
                                    Spacer()
                                }
                            }
                            .frame(height: 100)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.getData(puuid: user.puuid)
        }
        .padding()
        .makeMoreView()g
    }
    
}
