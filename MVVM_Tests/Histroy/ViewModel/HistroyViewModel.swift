//
//  HomeViewModel.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Combine

class HistoryViewModel: BaseViewModel {
                
    let version = "v5"
                
    @Published var history = [String]()
    @Published var isHistory: Bool = false
    
    let networkManager: NetworkManagerDelegate
    init(networkManager: NetworkManagerDelegate = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getData(puuid: String) {
        history = []
        isHistory = false
        
        loadingSingleton.loading()
        
        let endPoint = "\(version)/matches/by-puuid/\(puuid)/ids"
        
        let parameters: [String: String] = [
            "start": "0",
            "count": "20"
        ]
        
        networkManager.getMultipleData(startPoint: .asia, middlePoint: .match, endPoint: endPoint, parameters: parameters, type: String.self)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.toastSingleton.setState(.ERROR, error.localizedDescription)
                case .finished:
                    self?.toastSingleton.setState(.INFORMATION, "성공!")
                }
                
                self?.loadingSingleton.complete()
            } receiveValue: { [weak self] history in
                self?.history = history
                self?.isHistory = true
            }
            .store(in: &cancellables)
    }
    
}
