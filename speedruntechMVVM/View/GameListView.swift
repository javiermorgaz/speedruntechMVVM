//
//  GameListView.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 27/07/2020.
//  Copyright © 2020 Javier Morgaz. All rights reserved.
//

import SwiftUI

struct GameListView: View {
    
    @ObservedObject var viewModel: GameListViewModel
    
    init(viewModel: GameListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.gameItemsViewModel) { gameItem in
                GameItemView(viewModel: gameItem)
                    .onAppear {
                        gameItem.getImage()
                }
            }.onAppear {
                self.viewModel.getGames()
            }
        }
    }
}
