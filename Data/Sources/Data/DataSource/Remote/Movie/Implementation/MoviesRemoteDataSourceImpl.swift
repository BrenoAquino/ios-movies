//
//  MoviesRemoteDataSourceImpl.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

class MoviesRemoteDataSourceImpl {
    private let provider: NetworkProvider
    private let hostConfig: HostConfig
    
    init(provider: NetworkProvider, hostConfig: HostConfig) {
        self.provider = provider
        self.hostConfig = hostConfig
    }
}

extension MoviesRemoteDataSourceImpl: MoviesRemoteDataSource {
    func upcoming() -> AnyPublisher<[Movie], DataError> {
        provider.execute(endpoint: MovieAPIs.upcoming(config: hostConfig), keyPath: "results")
    }
}
