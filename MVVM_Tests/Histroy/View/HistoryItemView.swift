//
//  HomeItemView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import SwiftUI

struct HistoryItemView: View {
    
    let history: History
    
    var body: some View {
        ZStack {
            Text("HistoryItemView history.id = \(history.id)")
        }
    }
    
}
