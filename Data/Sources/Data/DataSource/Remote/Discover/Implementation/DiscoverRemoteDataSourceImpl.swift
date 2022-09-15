//
//  DiscoverRemoteDataSourceImpl.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public class DiscoverRemoteDataSourceImpl {
    private let provider: NetworkProvider
    private let hostConfig: HostConfig
    
    public init(provider: NetworkProvider, hostConfig: HostConfig) {
        self.provider = provider
        self.hostConfig = hostConfig
    }
}

extension DiscoverRemoteDataSourceImpl: DiscoverRemoteDataSource {
    public func movies(genre: Int) -> AnyPublisher<[Movie], DataError> {
        provider.execute(endpoint: GenreAPIs.genres(config: hostConfig), keyPath: "results")
    }
}
