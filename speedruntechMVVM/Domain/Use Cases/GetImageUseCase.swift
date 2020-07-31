//
//  GetImageUseCase.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 31/07/2020.
//  Copyright © 2020 Javier Morgaz. All rights reserved.
//

import Foundation
import Combine

protocol GetImageUseCase {
    func exec(url: URL) -> AnyPublisher<Data, URLError>
}

class GetImage: GetImageUseCase {
    
    private let gamesRepository: GamesRepositoryProtocol
    
    init(gamesRepository: GamesRepositoryProtocol) {
        self.gamesRepository = gamesRepository
    }
    
    func exec(url: URL) -> AnyPublisher<Data, URLError> {
        gamesRepository.fetchImage(url: url)
    }
}
