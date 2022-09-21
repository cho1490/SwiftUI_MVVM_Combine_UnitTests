//
//  HomeViewModel.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/18.
//

import Combine

class UserViewModel: ObservableObject {
    
    let version = "v4"
    
    @Published var userName: String = ""
        
    private var cancellables = Set<AnyCancellable>()
    @Published var user: User?
    
    func getData() {
        let endPoint = "\(version)/summoners/by-name/\(userName)"
        NetworkManager.shared.getSingleData(startPoint: .kr, middlePoint: .summoner, endPoint: endPoint, type: User.self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("UserViewModel getData Error \(error.localizedDescription)")
                case .finished:
                    print("UserViewModel getData Finished")
                }
            } receiveValue: { [weak self] user in                
                self?.user = user                
            }
            .store(in: &cancellables)
    }
    
}
