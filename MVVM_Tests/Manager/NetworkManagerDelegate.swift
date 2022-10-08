//
//  NetworkManagerDelegate.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/10/07.
//

import Combine

protocol NetworkManagerDelegate {
    func getSingleData<T: Decodable>(startPoint: StartPoint, middlePoint: MiddlePoint, endPoint: String, parameters: [String: String]?, type: T.Type) -> Future<T, Error>
    
    func getMultipleData<T: Decodable>(startPoint: StartPoint, middlePoint: MiddlePoint, endPoint: String, parameters: [String: String]?, type: T.Type) -> Future<[T], Error> 
}
