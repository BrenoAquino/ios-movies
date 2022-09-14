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
        let remoteDateSource = RemoteDataSourceFactory.movies()
        return MoviesRepositoryImpl(moviesRemoteDataSource: remoteDateSource)
    }
}
