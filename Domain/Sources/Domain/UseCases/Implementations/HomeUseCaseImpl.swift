//
//  HomeUseCaseImpl.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public final class HomeUseCaseImpl {
    
    private let moviesRepository: MoviesRepository
    private let genresRepository: GenreRepository
    
    // MARK: Inits
    public init(moviesRepository: MoviesRepository, genresRepository: GenreRepository) {
        self.moviesRepository = moviesRepository
        self.genresRepository = genresRepository
    }
}

// MARK: - Implementations
extension HomeUseCaseImpl: HomeUseCase {
    public func moviesByGenre() -> AnyPublisher<[Int : [Movie]], DomainError> {
        return moviesRepository
            .upcoming()
            .map { [0: $0] }
            .eraseToAnyPublisher()
    }
}
