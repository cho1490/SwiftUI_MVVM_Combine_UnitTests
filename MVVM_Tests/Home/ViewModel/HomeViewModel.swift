//
//  HomeViewModel.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

import Combine

protocol HomeViewModelDelegate: AnyObject {
    func didReceiveHomeData(flights: [Flight])
}

class HomeViewModel: ObservableObject {
    
    weak var delegate: HomeViewModelDelegate?
    
    private var cancellables = Set<AnyCancellable>()
    @Published var flights = [Flight]()
    
    func getData() {
        NetworkManager.shared.getData(endPoint: .flight, type: Flight.self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error is \(error.localizedDescription)")
                case .finished:
                    print("Finished")
                }
            }
            receiveValue: { [weak self] flightsData in
                self?.flights = flightsData
            }
            .store(in: &cancellables)
    }
    
}
