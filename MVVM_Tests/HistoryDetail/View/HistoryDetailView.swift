//
//  FlightDetailView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import SwiftUI

struct HistoryDetailView: View {
        
    @StateObject var viewModel = HistoryDetailViewModel()    
        
}

extension HistoryDetailView {
    
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
    
