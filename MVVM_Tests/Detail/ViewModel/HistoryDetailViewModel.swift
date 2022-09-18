//
//  File.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Combine

class HistoryDetailViewModel: ObservableObject {
        
    let version = "v5"
    
    private var cancellables = Set<AnyCancellable>()
    @Published var historyDetail: HistoryDetail?
    
    func getData(matchId: String) {
        let endPoint = "\(version)/matches/\(matchId)"
        
        NetworkManager.shared.getData(startPoint: .asia, middlePoint: .summoner, endPoint: endPoint, type: HistoryDetail.self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error is \(error.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] historyDetail in
                self?.historyDetail = historyDetail.first
            }
            .store(in: &cancellables)
    }
    
}
