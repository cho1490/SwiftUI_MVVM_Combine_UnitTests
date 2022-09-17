//
//  HomeItemView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import SwiftUI

struct HomeItemView: View {
    
    let flight: Flight
    
    var body: some View {
        ZStack {
            Text("HomeItemView flight.id = \(flight.id)")
        }
    }
    
}
