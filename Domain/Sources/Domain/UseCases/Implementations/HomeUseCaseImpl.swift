//
//  HomeUseCaseImpl.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

public class HomeUseCaseImpl {
    
    private let moviesRepository: MoviesRepository
    
    // MARK: Inits
    public init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
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
