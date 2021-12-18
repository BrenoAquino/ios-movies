//
//  NetworkFactory.swift
//  Services
//
//  Created by Breno Aquino on 17/12/21.
//  Copyright © 2021 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

enum NetworkFactory {
    
    static var config: MovieDBConfig { return MovieDBConfig() }
    
    static func movie(endpointClosure: @escaping ((MovieAPIs) -> Endpoint) = MoyaProvider.defaultEndpointMapping,
                      stubClosure: @escaping ((MovieAPIs) -> Moya.StubBehavior) = MoyaProvider.neverStub,
                      plugins: [PluginType] = []) -> MovieNetwork {
        let provider = MoyaProvider<MovieAPIs>(endpointClosure: endpointClosure, stubClosure: stubClosure, plugins: plugins)
        return MovieNetworkImpl(provider: provider, config: Self.config)
    }
    
    static func genre(endpointClosure: @escaping ((GenreAPIs) -> Endpoint) = MoyaProvider.defaultEndpointMapping,
                      stubClosure: @escaping ((GenreAPIs) -> Moya.StubBehavior) = MoyaProvider.neverStub,
                      plugins: [PluginType] = []) -> GenreNetwork {
        let provider = MoyaProvider<GenreAPIs>(endpointClosure: endpointClosure, stubClosure: stubClosure, plugins: plugins)
        return GenreNetworkImpl(provider: provider, config: Self.config)
    }
    
    static func discover(endpointClosure: @escaping ((DiscoverAPIs) -> Endpoint) = MoyaProvider.defaultEndpointMapping,
                         stubClosure: @escaping ((DiscoverAPIs) -> Moya.StubBehavior) = MoyaProvider.neverStub,
                         plugins: [PluginType] = []) -> DiscoverNetwork {
        let provider = MoyaProvider<DiscoverAPIs>(endpointClosure: endpointClosure, stubClosure: stubClosure, plugins: plugins)
        return DiscoverNetworkImpl(provider: provider, config: Self.config)
    }
}
