//
//  MoviesRepository.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain
import Combine

public class MoviesRepositoryImpl {
    
    private let moviesRemoteDataSource: MoviesRemoteDataSource
    
    public init(moviesRemoteDataSource: MoviesRemoteDataSource) {
        self.moviesRemoteDataSource = moviesRemoteDataSource
    }
}

// MARK: - Implementation
extension MoviesRepositoryImpl: Domain.MoviesRepository {
    public func upcoming() -> AnyPublisher<[Domain.Movie], Domain.DomainError> {
        return moviesRemoteDataSource
            .upcoming()
            .map { $0.map { $0.toDomain() } }
            .mapError { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
