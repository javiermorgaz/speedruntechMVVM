//
//  GameResponse.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 31/07/2020.
//

import Foundation

struct GameResponse: Decodable {
    let data: [Game]
}

struct Game: Decodable, Hashable {
    let gameId: String
    let name: GameName
    let assets: GameAssets
    
    enum CodingKeys: String, CodingKey {
      case gameId = "id"
      case name = "names"
      case assets
    }
    
    static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.gameId == rhs.gameId
    }
}

struct GameName: Decodable, Hashable {
    let international: String
}

struct GameAssets: Decodable, Hashable {
    let icon: GameIcon
    
    static func == (lhs: GameAssets, rhs: GameAssets) -> Bool {
        return lhs.icon == lhs.icon
    }
}

struct GameIcon: Decodable, Hashable {
    let uri: String
}
