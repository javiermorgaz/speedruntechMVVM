//
//  GetGamesUseCase.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 30/07/2020.
//  Copyright © 2020 Javier Morgaz. All rights reserved.
//

import Foundation
import Combine

protocol GetGamesUseCase {
    func exec() -> AnyPublisher<[Game], Error>
}

class GetGames: GetGamesUseCase {
    
    private let gamesRepository: GamesRepositoryProtocol
    
    init(gamesRepository: GamesRepositoryProtocol) {
        self.gamesRepository = gamesRepository
    }
    
    func exec() -> AnyPublisher<[Game], Error> {
        gamesRepository.fetchGameList()
            .map { $0.data }
            .eraseToAnyPublisher()
    }
}
