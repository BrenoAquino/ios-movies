//
//  HomeViewModel.swift
//  App
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Services

class HomeViewModel {
    let genreNetwork: GenreInterface
    let discoverNetwork: DiscoverInterface
    
    init() {
        genreNetwork = GenreInterface()
        discoverNetwork = DiscoverInterface()
    }
}

// MARK: - Network Calls
extension HomeViewModel {
    func genres() {
        genreNetwork.genres()
    }
}
