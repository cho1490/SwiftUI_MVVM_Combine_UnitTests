//
//  ContentView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var loading = LoadingSingleton.shared
            
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
                
                if loading.isLoading {
                    ProgressView()
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(.ultraThickMaterial)
                }
            }
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().showsVerticalScrollIndicator = false
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

