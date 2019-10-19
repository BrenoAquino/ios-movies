//
//  DiscoverInterface.swift
//  Services
//
//  Created by Breno Aquino on 29/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation

public class DiscoverInterface {
    
    private var network: Network<DiscoverAPI> = Network<DiscoverAPI>()
    private var config: MovieDBConfig = MovieDBConfig()
    
    public init() {}
    
    public func movies(genre: Int) {
        network.request(DiscoverAPI.discoverMovie(config: config, genre: genre)) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
