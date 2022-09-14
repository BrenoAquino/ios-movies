//
//  RemoteDataSourceFactory.swift
//  Movies
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Data

enum RemoteDataSourceFactory {
    
    private static var provider: NetworkProvider = URLSessionNetworkProvider(session: .shared)
    private static var hostConfig: HostConfig = TMDBConfig()
    
    static func movies() -> MoviesRemoteDataSource {
        MoviesRemoteDataSourceImpl(provider: provider, hostConfig: hostConfig)
    }
}
