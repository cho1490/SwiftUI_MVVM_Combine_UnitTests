//
//  ContentView.swift
//  MVVM_Tests
//
//  Created by ์กฐ์ํ on 2022/09/17.
//

import SwiftUI

struct ContentView: View {
            
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
        
}

extension ContentView {

    var body: some View {
        NavigationStack {
            HomeView()
                .navigationTitle("HomeView")
        }
    }    
    
}
