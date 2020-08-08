//
//  SpeedRunAPI.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 28/07/2020.
//

import Foundation
import Combine

enum SpeedRunAPIRouter {
    
    case games
    case runs(gameId: String)
    case users(userId: String)
    
    struct RouterKeys {
        static let game = "game"
    }
    
    var method: String {
        
        switch self {
        case .games: return "GET"
        case .runs: return "GET"
        case .users: return "GET"
        }
    }
    
    var path: String {
        
        switch self {
        case .games: return "/games"
        case .runs: return "/runs"
        case .users(let userId): return "/users/\(userId)"
        }
    }
    
    var quertItems: [URLQueryItem] {
        switch self {
        case .games: return []
        case .runs(let gameId): return [URLQueryItem(name: RouterKeys.game, value: gameId)]
        case .users: return []
        }
    }
}
