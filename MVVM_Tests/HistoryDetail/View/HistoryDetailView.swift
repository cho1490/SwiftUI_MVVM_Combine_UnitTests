//
//  FlightDetailView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import SwiftUI

struct HistoryDetailView: View {
        
    @StateObject var viewModel = HistoryDetailViewModel()
    
    var matchId: String
        
}

extension HistoryDetailView {
    
    var body: some View {
        VStack {
            Text("MatchId : \(matchId)")
            
            if viewModel.isHistoryDetail {
                VStack {
                    Text("GameMode : \(viewModel.historyDetail!.info.gameMode)")
                    
                    Text("GameType : \(viewModel.historyDetail!.info.gameType)")
                    
                    Text("GameId : \(viewModel.historyDetail!.info.gameId)")
                    
                    Text("gameStartTimestamp : \(viewModel.historyDetail!.info.gameStartTimestamp)")
                    
                    Text("gameEndTimestamp : \(viewModel.historyDetail!.info.gameEndTimestamp)")
                }
            }
            
            Spacer()
        }
        .onAppear {
            viewModel.getData(matchId: matchId)
        }
        .padding()
        .makeMoreView()
    }    
    
}
    
