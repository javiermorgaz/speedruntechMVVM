//
//  GameItemView.swift
//  speedruntechMVVM
//
//  Created by Jmorgaz on 31/07/2020.
//  Copyright © 2020 Javier Morgaz. All rights reserved.
//

import SwiftUI

struct GameItemView: View {
    
    @ObservedObject var viewModel: GameItemViewModel
    
    init(viewModel: GameItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Image(uiImage: viewModel.image ?? UIImage())
                .resizable()
                .frame(width: 40.0, height: 40.0, alignment: .center)
                
            Text(viewModel.name)
        }
    }
}
