//
//  DiscoverNetwork.swift
//  Services
//
//  Created by Breno Aquino on 29/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

protocol DiscoverNetwork: AnyObject {
    func movies(genre: Int, callback: @escaping (Result<[Movie], MoviesError>) -> Void)
}

class DiscoverNetworkImpl: Network {
    typealias TargetApi = DiscoverAPIs
    
    let provider: Moya.MoyaProvider<TargetApi>
    let config: MovieDBConfig
    
    init(provider: Moya.MoyaProvider<TargetApi>, config: MovieDBConfig) {
        self.provider = provider
        self.config = config
    }
}

extension DiscoverNetworkImpl: DiscoverNetwork {
    func movies(genre: Int, callback: @escaping (Result<[Movie], MoviesError>) -> Void) {
        let api = DiscoverAPIs.discoverMovie(genre: genre, config: config)
        execute(api: api, atKeyPath: "results", callback: callback)
    }
}
