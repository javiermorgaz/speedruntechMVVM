//
//  GameItemViewModel.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 30/07/2020.
//  Copyright © 2020 Javier Morgaz. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class GameItemViewModel: Identifiable, ObservableObject {
    
    private let getImageUseCase: GetImageUseCase
    private var cancellable = Set<AnyCancellable>()
    
    private var game: Game
    
    init(game: Game, getImageUseCase: GetImageUseCase) {
        self.game = game
        self.getImageUseCase = getImageUseCase        
    }

    var id: String {
        return game.gameId
    }
    var name: String {
        return game.name.international
    }
    
    @Published var image: UIImage?
    
    func getImage() {
        guard let url = URL(string: game.assets.icon.uri) else {
            return
        }
        
        getImageUseCase.exec(url: url)
            .receive(on: DispatchQueue.main)
            .map { UIImage(data: $0) }
            .sink(receiveCompletion: { _ in
                
            }, receiveValue: { image in
                self.image = image
            })
            .store(in: &cancellable)
    }
}
