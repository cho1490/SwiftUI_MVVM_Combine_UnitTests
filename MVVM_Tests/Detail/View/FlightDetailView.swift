//
//  FlightDetailView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import SwiftUI

struct FlightDetailView: View {
    
    var flightId: Int
    @ObservedObject var viewModel = FlightDetailViewModel()
    
    var body: some View {
        ZStack {
            Text("FlightDetailView flightId = \(flightId)")
        }
    }
    
}
    
