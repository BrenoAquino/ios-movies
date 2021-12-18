//
//  MovieNetwork.swift
//  Services
//
//  Created by Breno Aquino on 21/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

protocol MovieNetwork: AnyObject {
    func upcoming(callback: @escaping (Result<[Movie], MoviesError>) -> Void)
    func detail(id: Int, callback: @escaping (Result<Movie, MoviesError>) -> Void)
    func keywords(id: Int, callback: @escaping (Result<[Keyword], MoviesError>) -> Void)
    func recommendations(id: Int, callback: @escaping (Result<[Movie], MoviesError>) -> Void)
}

class MovieNetworkImpl: Network {
    typealias TargetApi = MovieAPIs
    
    let provider: Moya.MoyaProvider<TargetApi>
    let config: MovieDBConfig
    
    init(provider: Moya.MoyaProvider<TargetApi>, config: MovieDBConfig) {
        self.provider = provider
        self.config = config
    }
}

extension MovieNetworkImpl: MovieNetwork {
    func upcoming(callback: @escaping (Result<[Movie], MoviesError>) -> Void) {
        let api = MovieAPIs.upcoming(config: config)
        execute(api: api, atKeyPath: "results", callback: callback)
    }
    
    func detail(id: Int, callback: @escaping (Result<Movie, MoviesError>) -> Void) {
        let api = MovieAPIs.detail(id: id, config: config)
        execute(api: api, callback: callback)
    }
    
    func keywords(id: Int, callback: @escaping (Result<[Keyword], MoviesError>) -> Void) {
        let api = MovieAPIs.keywords(id: id, config: config)
        execute(api: api, atKeyPath: "keywords", callback: callback)
    }
    
    func recommendations(id: Int, callback: @escaping (Result<[Movie], MoviesError>) -> Void) {
        let api = MovieAPIs.recommendations(id: id, config: config)
        execute(api: api, atKeyPath: "results", callback: callback)
    }
}
