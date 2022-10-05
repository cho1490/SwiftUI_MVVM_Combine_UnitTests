//
//  HomeViewModel.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/18.
//

import Combine

class HomeViewModel: BaseViewModel {
            
    let version = "v4"
    
    @Published var summonerName: String = ""
    
    @Published var user: User?
    @Published var isUser: Bool = false
    
    let networkManager: NetworkManagerDelegate    
    init(networkManager: NetworkManagerDelegate = NetworkManager()) {
        self.networkManager = networkManager
    }
        
    func getData() {
        user = nil
        isUser = false
        
        loadingSingleton.loading()
        
        let endPoint = "\(version)/summoners/by-name/\(summonerName)"        
        networkManager.getSingleData(startPoint: .kr, middlePoint: .summoner, endPoint: endPoint, parameters: nil, type: User.self)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.toastSingleton.setState(.ERROR, error.localizedDescription)
                case .finished:
                    self?.toastSingleton.setState(.INFORMATION, "성공!")
                }
                
                self?.loadingSingleton.complete()
            } receiveValue: { [weak self] user in
                self?.user = user
                self?.isUser = true
            }
            .store(in: &cancellables)
    }
    
}
