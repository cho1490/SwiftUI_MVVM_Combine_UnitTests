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
            
    func getData() {
        loadingSingleton.loading()
        
        let endPoint = "\(version)/summoners/by-name/\(userName)"
        NetworkManager.shared.getSingleData(startPoint: .kr, middlePoint: .summoner, endPoint: endPoint, type: User.self)
            .handleEvents(receiveSubscription: { (subscription) in
                print("Receive Subscription")
            }, receiveOutput: { output in
                print("Receive Output : \(output)")
            }, receiveCompletion: { (completion) in
                print("Receive Completion")
                switch completion {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print(error)
                }
            }, receiveCancel: {
//                print("!!! \(self.user?.accountId ?? "ㅠㅠ")")
                print("Receive Cancel")
            }, receiveRequest: { demand in
                print("Receive Request: \(demand)")
            })
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
