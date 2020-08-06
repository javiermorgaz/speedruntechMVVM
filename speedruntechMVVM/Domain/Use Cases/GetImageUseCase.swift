//
//  GetImageUseCase.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 31/07/2020.
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
