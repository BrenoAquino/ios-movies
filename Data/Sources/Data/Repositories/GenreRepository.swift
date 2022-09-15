//
//  GenreRepository.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain
import Combine

public class GenreRepositoryImpl {
    
    private let genreRemoteDataSource: GenreRemoteDataSource
    
    public init(genreRemoteDataSource: GenreRemoteDataSource) {
        self.genreRemoteDataSource = genreRemoteDataSource
    }
}

// MARK: - Implementation
extension GenreRepositoryImpl: Domain.GenreRepository {
    public func genres() -> AnyPublisher<[Domain.Genre], DomainError> {
        return genreRemoteDataSource
            .genres()
            .map { $0.map { $0.toDomain() } }
            .mapError { $0.toDomain() }
            .eraseToAnyPublisher()
    }
}
