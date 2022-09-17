//
//  File.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Combine

class FlightDetailViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    @Published var detail: FlightDetail?
    
    func getData() {
        NetworkManager.shared.getData(endPoint: .detail, type: FlightDetail.self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error is \(error.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            } receiveValue: { [weak self] detail in
                self?.detail = detail.first
            }
            .store(in: &cancellables)
    }
    
}
