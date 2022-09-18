//
//  ContentView.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import SwiftUI

struct ContentView: View {
            
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.yellow)
                    .ignoresSafeArea()
                
                UserView()
                    .navigationTitle("MVVM_Tests")
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

