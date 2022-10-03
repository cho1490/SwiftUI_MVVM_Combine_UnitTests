//
//  User.swift
//  MVVM_Tests
//
//  Created by 조상현 on 2022/09/18.
//

struct User: Decodable, Identifiable, Hashable {
    var id: String // Encrypted summoner ID. Max length 63 characters.
    var accountId: String
    var profileIconId: Int
//    var revisionDate: Double
    var name: String 
    var puuid: String
    var summonerLevel: Int
}
