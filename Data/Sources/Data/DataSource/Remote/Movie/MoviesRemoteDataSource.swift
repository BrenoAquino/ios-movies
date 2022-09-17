//
//  MoviesRemoteDataSource.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public protocol MoviesRemoteDataSource {
    func upcoming() -> AnyPublisher<[Movie], DataError>
    func detail(id: Int) -> AnyPublisher<Movie, DataError>
}
