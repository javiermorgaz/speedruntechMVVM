//
//  SpeedRunAPI.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 28/07/2020.
//

import Foundation
import Combine

enum SpeedRunAPI {
    
    case games(baseUrl: String)
    case runs(baseUrl: String, gameId: String)
    case users(baseUrl: String, userId: String)
    
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
        case .games(let baseUrl): return "\(baseUrl)/games"
        case .runs(let baseUrl, _): return "\(baseUrl)/runs"
        case .users(let baseUrl, let userId): return "\(baseUrl)/users/\(userId)"
        }
    }
    
    var quertItems: [URLQueryItem] {
        switch self {
        case .games: return []
        case .runs(_, let gameId): return [URLQueryItem(name: RouterKeys.game, value: gameId)]
        case .users: return []
        }
    }
    
    func asURLRequest() -> URLRequest {
        var components = URLComponents(string: path)
        components?.queryItems = quertItems
        
        var urlRequest = URLRequest(url: (components?.url)!)
        urlRequest.httpMethod = method
        
        return urlRequest
    }
}
