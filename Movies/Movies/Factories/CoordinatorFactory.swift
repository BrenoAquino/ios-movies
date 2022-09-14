//
//  CoordinatorFactory.swift
//  Movies
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

enum CoordinatorFactory {
    
    static func home() -> HomeCoordinator {
        let viewModel = ViewModelFactory.homeCoordinator()
        return HomeCoordinator(viewModel: viewModel)
    }
}
