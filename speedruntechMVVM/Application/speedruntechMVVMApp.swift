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
    let getGamesUseCase = GetGames(gamesRepository: GamesRepository(restClient: RestClient(baseUrl: Constants.baseURL)))
    let getImageUseCase = GetImage(gamesRepository: GamesRepository(restClient: RestClient(baseUrl: Constants.baseURL)))
    let contentView = GameListView(viewModel: GameListViewModel(getGamesUseCase: getGamesUseCase, getImageUseCase: getImageUseCase))
    
    return contentView
}
