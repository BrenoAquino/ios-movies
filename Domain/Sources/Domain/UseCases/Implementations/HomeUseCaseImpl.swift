//
//  HomeUseCaseImpl.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public class HomeUseCaseImpl {
    
    private let genresRepository: GenresRepository
    private let moviesRepository: MoviesRepository
    
    // MARK: Inits
    private init(genresRepository: GenresRepository, moviesRepository: MoviesRepository) {
        self.genresRepository = genresRepository
        self.moviesRepository = moviesRepository
    }
}

// MARK: - Implementations
extension HomeUseCaseImpl: HomeUseCase {
    public func moviesByGenre() -> AnyPublisher<[Genre : Movie], DomainError> {
        return Empty()
            .setFailureType(to: DomainError.self)
            .eraseToAnyPublisher()
    }
}
