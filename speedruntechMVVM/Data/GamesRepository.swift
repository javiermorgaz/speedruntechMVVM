//
//  GamesRepository.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 30/07/2020.
//

import Foundation
import Combine

protocol GamesRepositoryProtocol {
    func fetchGameList() -> AnyPublisher<GameResponse, Error>
    func fetchImage(url: URL) -> AnyPublisher<Data, URLError>
}

class GamesRepository {
    let restClient: RestClient
    
    init(restClient: RestClient) {
        self.restClient = restClient
    }
}

extension GamesRepository: GamesRepositoryProtocol {
    func fetchGameList() -> AnyPublisher<GameResponse, Error> {
        let request = SpeedRunAPI.games(baseUrl: Constants.baseURL).asURLRequest()
        return restClient.perform(request)
    }
    
    func fetchImage(url: URL) -> AnyPublisher<Data, URLError> {
        return restClient.load(url: url)
    }
}
