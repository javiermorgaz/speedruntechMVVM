//
//  GameListViewModel.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 30/07/2020.
//  Copyright © 2020 Javier Morgaz. All rights reserved.
//

import Foundation
import Combine

class GameListViewModel: ObservableObject {
    
    @Published var gameItemsViewModel =  [GameItemViewModel]()
    
    private let getGamesUseCase: GetGamesUseCase
    private let getImageUseCase: GetImageUseCase
    private var cancellable = Set<AnyCancellable>()
    
    init(getGamesUseCase: GetGamesUseCase, getImageUseCase: GetImageUseCase) {
        self.getGamesUseCase = getGamesUseCase
        self.getImageUseCase = getImageUseCase
    }
    
    func getGames() {
        getGamesUseCase.exec()
            .receive(on: DispatchQueue.main)
            .map { games in games.map { GameItemViewModel(game: $0, getImageUseCase: self.getImageUseCase)}}
            .sink(receiveCompletion: { error in
                switch error {
                case .finished:
                    break
                case .failure:
                    self.gameItemsViewModel = []
                }
                
            }, receiveValue: { gameItemsViewModel in
                self.gameItemsViewModel = gameItemsViewModel
            }).store(in: &cancellable)
    }
}
