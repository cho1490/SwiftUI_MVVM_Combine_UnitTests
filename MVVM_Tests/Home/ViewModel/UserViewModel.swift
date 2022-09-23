//
//  HomeViewModel.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/18.
//

import Combine

class UserViewModel: BaseViewModel {
            
    let version = "v4"
    
    @Published var userName: String = ""
    @Published var user: User?        
    
    private var cancellables = Set<AnyCancellable>()
    
    func getData() {
        loadingSingleton.loading()
        
        let endPoint = "\(version)/summoners/by-name/\(userName)"
        NetworkManager.shared.getSingleData(startPoint: .kr, middlePoint: .summoner, endPoint: endPoint, type: User.self)
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print("UserViewModel getData Error \(error.localizedDescription)")
                case .finished:
                    print("UserViewModel getData Finished")
                }

                print("호출 좀")
                self?.loadingSingleton.complete()
            } receiveValue: { [weak self] user in
                self?.user = user

                print("되라")
                self?.loadingSingleton.complete()
            }
            .store(in: &cancellables)
    }
    
}
