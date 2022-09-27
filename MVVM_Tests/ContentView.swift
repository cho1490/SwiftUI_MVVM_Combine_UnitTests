//
//  ContentView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var loadingSingleton = LoadingSingleton.shared
            
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.blue)
                    .ignoresSafeArea()
                
                UserView()
                    .navigationTitle("Search User")
                
                if loadingSingleton.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.thinMaterial)
                }
            }
        }
    }
}
