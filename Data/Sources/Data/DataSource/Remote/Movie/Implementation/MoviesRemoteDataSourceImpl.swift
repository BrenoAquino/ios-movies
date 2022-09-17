//
//  MoviesRemoteDataSourceImpl.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public class MoviesRemoteDataSourceImpl {
    private let provider: NetworkProvider
    private let hostConfig: HostConfig
    
    public init(provider: NetworkProvider, hostConfig: HostConfig) {
        self.provider = provider
        self.hostConfig = hostConfig
    }
}

extension MoviesRemoteDataSourceImpl: MoviesRemoteDataSource {
    public func upcoming() -> AnyPublisher<[Movie], DataError> {
        provider.execute(endpoint: MovieAPIs.upcoming(config: hostConfig), keyPath: "results")
    }
    
    public func detail(id: Int) -> AnyPublisher<Movie, DataError> {
        provider.execute(endpoint: MovieAPIs.detail(config: hostConfig, id: id), keyPath: nil)
    }
}
