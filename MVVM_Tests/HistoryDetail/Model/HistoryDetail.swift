//
//  FlightDetail.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/17.
//

struct HistoryDetail: Decodable {
    var metadata: Metadata
    var info: Info
}

struct Metadata: Decodable {
    var dataVersion: String
    var matchId: String
    var participants: [String]
}

struct Info: Decodable {    
    var gameCreation: Double
    var gameDuration: Double
    var gameStartTimestamp: Double
    var gameEndTimestamp: Double
    var gameId: Double
    var gameMode: String
    var gameType: String
}
