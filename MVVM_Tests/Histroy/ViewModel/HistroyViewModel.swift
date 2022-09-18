//
//  HomeViewModel.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Combine

class HistoryViewModel: ObservableObject {
            
    // ex) matches/by-puuid/w11f1vxwmiUdHj04AXcydzNyslacNNayFIGWdlA40GOMAYIJfHjbfQx4WfITz4caEHSM3klb-eEj0A/ids?start=0&count=20
    let version = "v5"
    
    var didReceiveData: (([History]) -> Void)?
    
    private var cancellables = Set<AnyCancellable>()
    @Published var history = [History]()
    
    func getData(puuid: String) {
        let endPoint = "\(version)/matches/by-puuid/\(puuid)/ids"
        
        let parameters: [String: String] = [
            "start": "0",
            "count": "20"
        ]
        
        NetworkManager.shared.getData(startPoint: .asia, middlePoint: .match, endPoint: endPoint, parameters: parameters, type: History.self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error is \(error.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }    receiveValue: { [weak self] history in
                self?.history = history
            }
            .store(in: &cancellables)
    }
    
}
