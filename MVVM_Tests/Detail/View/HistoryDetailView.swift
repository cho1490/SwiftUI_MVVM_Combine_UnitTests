//
//  FlightDetailView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import SwiftUI

struct HistoryDetailView: View {
        
    @ObservedObject var viewModel = HistoryDetailViewModel()
    
    
    var body: some View {
        VStack {
            Text("HistoryDetailView")
        }
        .padding()
        .onAppear {
            viewModel.getData(matchId: "")
        }
    }
    
}
    
