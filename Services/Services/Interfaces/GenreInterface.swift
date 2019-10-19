//
//  GenreInterface.swift
//  Services
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation

public class GenreInterface {
    
    private var network: Network<GenreAPI> = Network<GenreAPI>()
    private var config: MovieDBConfig = MovieDBConfig()
    
    public init() {}
    
    public func genres() {
        network.request(GenreAPI.genres(config: config)) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}
