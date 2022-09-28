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
    
    func getData(matchId: String) {
        loadingSingleton.loading()
        
        let endPoint = "\(version)/matches/\(matchId)"
        
        NetworkManager.shared.getSingleData(startPoint: .asia, middlePoint: .summoner, endPoint: endPoint, type: HistoryDetail.self)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.toastSingleton.setState(.ERROR, error.localizedDescription)
                case .finished:
                    self?.loadingSingleton.complete()
                }
            } receiveValue: { [weak self] historyDetail in
                self?.historyDetail = historyDetail
            }
            .store(in: &cancellables)
    }
    
}
