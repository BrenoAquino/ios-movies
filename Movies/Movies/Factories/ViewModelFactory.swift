//
//  ViewModelFactory.swift
//  Movies
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Home

enum ViewModelFactory {
    
    static func home() -> HomeViewModel {
        let homeUseCase = UseCaseFactory.home()
        return HomeViewModel(homeUseCase: homeUseCase)
    }
    
    static func homeCoordinator() -> HomeCoordinatorViewModel {
        return HomeCoordinatorViewModel(viewModel: Self.home())
    }
}
