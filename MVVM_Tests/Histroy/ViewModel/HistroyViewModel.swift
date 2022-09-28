//
//  HomeViewModel.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Combine

class HistoryViewModel: BaseViewModel {
                
    let version = "v5"
                
    @Published var history = [History]()
    
    func getData(puuid: String) {
        loadingSingleton.loading()
        
        let endPoint = "\(version)/matches/by-puuid/\(puuid)/ids"
        
        let parameters: [String: String] = [
            "start": "0",
            "count": "20"
        ]
        
        NetworkManager.shared.getMultipleData(startPoint: .asia, middlePoint: .match, endPoint: endPoint, parameters: parameters, type: History.self)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.toastSingleton.setState(.ERROR, error.localizedDescription)                    
                case .finished:
                    self?.loadingSingleton.complete()
                }
            } receiveValue: { [weak self] history in
                self?.history = history
            }
            .store(in: &cancellables)
    }
    
}
