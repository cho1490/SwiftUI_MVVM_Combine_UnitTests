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
        NetworkManager.shared.getData()
    }
    
    
}
