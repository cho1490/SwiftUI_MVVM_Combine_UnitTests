//
//  FlightDetail.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

struct FlightDetail: Decodable, Identifiable, Hashable {
    var id: Int?
    var fare: Int?
    var stops: Int?
    var flightNumber: String?
    var company: String?
    var departure: String?
    var arrival: String?
    var duration: String?
    var source: String?
    var destination: String?
    var sourceCode: String?
    var destinationCode: String?
    var sourceAirport: String?
    var destinationAirport: String?
    var baggage: String?
    var checkin: String?
    var cabin: String?
    var fareType: String?
    var cancellable: Bool?
    var discountPercentage: Int?
}
