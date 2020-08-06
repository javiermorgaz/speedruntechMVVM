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
            if !viewModel.isLoaded {
                HStack {
                    Spacer()
                    Text("Loading").onAppear(perform: viewModel.getGames)
                    Spacer()
                }
            } else {
                List(viewModel.gameItemsViewModel) { gameItem in
                    GameItemView(viewModel: gameItem)
                        .onAppear(perform: gameItem.getImage)
                }
            }
        }
    }
}
