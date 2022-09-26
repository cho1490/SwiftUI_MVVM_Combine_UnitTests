//
//  HomeViewModel.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/18.
//

import Combine

class UserViewModel: BaseViewModel {
            
    let version = "v4"
                    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var userName: String = ""
    @Published var user: User?
    
    override init() {
        print("init")
    }
    
    deinit {
         print("deinit")
     }
            
    func getData() {
        print("\(LoadingSingleton.shared.isLoading)")
        
        let endPoint = "\(version)/summoners/by-name/\(userName)"
        NetworkManager.shared.getSingleData(startPoint: .kr, middlePoint: .summoner, endPoint: endPoint, type: User.self)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("UserViewModel getData Error \(error.localizedDescription)")
                case .finished:
                    print("UserViewModel getData Finished")
                }

                LoadingSingleton.shared.complete()
            } receiveValue: { [weak self] user in
                self?.user = user

                LoadingSingleton.shared.complete()
            }
            .store(in: &cancellables)
    }
    
}
