//
//  GenreRemoteDataSourceImpl.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public class GenreRemoteDataSourceImpl {
    private let provider: NetworkProvider
    private let hostConfig: HostConfig
    
    public init(provider: NetworkProvider, hostConfig: HostConfig) {
        self.provider = provider
        self.hostConfig = hostConfig
    }
}

extension GenreRemoteDataSourceImpl: GenreRemoteDataSource {
    public func genres() -> AnyPublisher<[Genre], DataError> {
        provider.execute(endpoint: GenreAPIs.genres(config: hostConfig), keyPath: "genres")
    }
}
