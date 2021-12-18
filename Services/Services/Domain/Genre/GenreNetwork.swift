//
//  GenreNetwork.swift
//  Services
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

protocol GenreNetwork: AnyObject {
    func genres(callback: @escaping (Result<[Genre], MoviesError>) -> Void)
}

class GenreNetworkImpl: Network {
    typealias TargetApi = GenreAPIs
    
    let provider: Moya.MoyaProvider<TargetApi>
    let config: MovieDBConfig
    
    init(provider: Moya.MoyaProvider<TargetApi>, config: MovieDBConfig) {
        self.provider = provider
        self.config = config
    }
}

extension GenreNetworkImpl: GenreNetwork {
    func genres(callback: @escaping (Result<[Genre], MoviesError>) -> Void) {
        let api = GenreAPIs.genres(config: config)
        execute(api: api, atKeyPath: "genres", callback: callback)
    }
}
