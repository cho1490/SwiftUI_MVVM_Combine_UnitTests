//
//  Flight.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

struct History: Decodable, Identifiable, Hashable {
    var id: Int
    var fare: Int
    var stops: Int
    var flightNumber: String?
    var company: String?
    var departure: String?
    var arrival: String?
    var duration: String?
    var soruce: String?
    var destination: String?
    var sourceCode: String?
    var destinationCode: String?
}
