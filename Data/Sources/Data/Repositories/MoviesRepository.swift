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
    private let discoverRemoteDataSource: DiscoverRemoteDataSource
    
    public init(moviesRemoteDataSource: MoviesRemoteDataSource,
                discoverRemoteDataSource: DiscoverRemoteDataSource) {
        self.moviesRemoteDataSource = moviesRemoteDataSource
        self.discoverRemoteDataSource = discoverRemoteDataSource
    }
}

// MARK: - Implementation
extension MoviesRepositoryImpl: Domain.MoviesRepository {
    public func upcoming() -> AnyPublisher<[Domain.Movie], Domain.DomainError> {
        moviesRemoteDataSource
            .upcoming()
            .map { $0.map { $0.toDomain() } }
            .mapError { $0.toDomain() }
            .eraseToAnyPublisher()
    }
    
    public func movies(genre: Int) -> AnyPublisher<[Domain.Movie], Domain.DomainError> {
        discoverRemoteDataSource
            .movies(genre: genre)
            .map { $0.map { $0.toDomain() } }
            .mapError { $0.toDomain() }
            .eraseToAnyPublisher()
    }
    
    public func detail(id: Int) -> AnyPublisher<Domain.Movie, Domain.DomainError> {
        moviesRemoteDataSource
            .detail(id: id)
            .map { $0.toDomain() }
            .mapError { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
