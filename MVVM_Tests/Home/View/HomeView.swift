//
//  ContentView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.flights, id: \.self) { value in
                        NavigationLink(destination: FlightDetailView(flightId: value.id)) {
                            HomeItemView(flight: value)                            
                        }
                        .foregroundColor(.black)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.getData()
        }
    }
}
