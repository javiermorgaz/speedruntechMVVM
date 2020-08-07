//
//  speedruntechMVVMApp.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 06/08/2020.
//

import SwiftUI

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            buildContentView()
        }
    }
}

func buildContentView() -> GameListView {
    let getGamesUseCase = GetGames(gamesRepository: GamesRepository(restClient: RestClient()))
    let getImageUseCase = GetImage(gamesRepository: GamesRepository(restClient: RestClient()))
    let contentView = GameListView(viewModel: GameListViewModel(getGamesUseCase: getGamesUseCase, getImageUseCase: getImageUseCase))
    
    return contentView
}
