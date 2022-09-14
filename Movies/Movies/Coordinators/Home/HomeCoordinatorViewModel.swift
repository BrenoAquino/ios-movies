//
//  HomeCoordinatorViewModel.swift
//  Movies
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Home

class HomeCoordinatorViewModel: ObservableObject {
    let homeViewModel: Home.HomeViewModel
    
    init(viewModel: Home.HomeViewModel) {
        self.homeViewModel = viewModel
    }
}
