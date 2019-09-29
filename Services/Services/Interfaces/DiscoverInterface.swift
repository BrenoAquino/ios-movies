//
//  DiscoverInterface.swift
//  Services
//
//  Created by Breno Aquino on 29/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation

class DiscoverInterface {
    
    private var provider: NetworkProvider<DiscoverAPI> = NetworkProvider<DiscoverAPI>()
    private var config: MovieDBConfig = MovieDBConfig()
    
    func movies() {
        provider.request(DiscoverAPI.discoverMovie(config: config)) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
