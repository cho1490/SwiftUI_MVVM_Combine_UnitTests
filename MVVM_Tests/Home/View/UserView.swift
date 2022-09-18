//
//  ContentView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Foundation
import SwiftUI

struct UserView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        VStack {
            TextField("User Name", text: $viewModel.userName)
            
            Spacer()
            
            Button("Get Data") {
                viewModel.getData()
            }
            
//            ScrollView {
//                LazyVStack {
//                    ForEach(viewModel.flights, id: \.self) { value in
//                        NavigationLink(destination: FlightDetailView(flightId: value.id)) {
//                            HomeItemView(flight: value)
//                        }
//                        .foregroundColor(.black)
//                    }
//                }
//            }
        }
        .padding()
    }
}
