//
//  RepositoryFactory.swift
//  Movies
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain
import Data

enum RepositoryFactory {
    
    static func movies() -> MoviesRepository {
        let discoverRemoteDataSource = RemoteDataSourceFactory.discover()
        let moviesRemoteDateSource = RemoteDataSourceFactory.movies()
        return MoviesRepositoryImpl(moviesRemoteDataSource: moviesRemoteDateSource, discoverRemoteDataSource: discoverRemoteDataSource)
    }
    
    static func genres() -> GenreRepository {
        let remoteDataSource = RemoteDataSourceFactory.genres()
        return GenreRepositoryImpl(genreRemoteDataSource: remoteDataSource)
    }
}
