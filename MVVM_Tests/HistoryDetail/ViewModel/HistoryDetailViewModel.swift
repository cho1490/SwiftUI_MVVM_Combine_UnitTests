//
//  File.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Combine

class HistoryDetailViewModel: BaseViewModel {
        
    let version = "v5"
        
    @Published var historyDetail: HistoryDetail?
    @Published var isHistoryDetail: Bool = false
    
    let networkManager: NetworkManagerDelegate
    init(networkManager: NetworkManagerDelegate = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func getData(matchId: String) {
        historyDetail = nil
        isHistoryDetail = false
        
        loadingSingleton.loading()
        
        let endPoint = "\(version)/matches/\(matchId)"
        
        networkManager.getSingleData(startPoint: .asia, middlePoint: .match, endPoint: endPoint, parameters: nil, type: HistoryDetail.self)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print("failure : \(error.localizedDescription)")
                    self?.toastSingleton.setState(.ERROR, error.localizedDescription)
                case .finished:
                    self?.toastSingleton.setState(.INFORMATION, "성공!")
                }
                                
                self?.loadingSingleton.complete()
            } receiveValue: { [weak self] historyDetail in
                self?.historyDetail = historyDetail
                self?.isHistoryDetail = true
            }
            .store(in: &cancellables)
    }
    
}
