//
//  HomeUseCaseImpl.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Combine

fileprivate extension Genre {
    static let upcoming: Genre = .init(id: -1, name: "Upcoming")
}

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
    public func moviesByGenre() -> AnyPublisher<[Genre : [Movie]], DomainError> {
        let upcomingPub = upcomings()
        let moviesByGenrePub = genres()
        
        return Publishers.Zip(upcomingPub, moviesByGenrePub)
            .map { (upcoming, moviesByGenre) in
                var allMovies = moviesByGenre
                allMovies[.upcoming] = upcoming
                return allMovies
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Utils
extension HomeUseCaseImpl {
    
    private func movies(genre: Genre) -> AnyPublisher<[Genre : [Movie]], DomainError> {
        moviesRepository
            .movies(genre: genre.id)
            .map { [genre: $0] }
            .eraseToAnyPublisher()
    }
    
    private func genres() -> AnyPublisher<[Genre : [Movie]], DomainError>  {
        genresRepository
            .genres()
            .flatMap { genres -> Publishers.Sequence<[AnyPublisher<[Genre : [Movie]], DomainError>], DomainError> in
                let pubs = genres.compactMap { [weak self] genre in
                    self?.movies(genre: genre)
                }
                return Publishers.Sequence(sequence: pubs)
            }
            .flatMap { $0 }
            .collect()
            .map { moviesByGenres in
                let combinedAttributes: NSMutableDictionary = NSMutableDictionary(dictionary: [:])
                moviesByGenres.forEach { combinedAttributes.addEntries(from: $0) }
                return (combinedAttributes as? [Genre : [Movie]]) ?? [:]
            }
            .eraseToAnyPublisher()
    }
    
    private func upcomings() -> AnyPublisher<[Movie], DomainError> {
        moviesRepository
            .upcoming()
            .eraseToAnyPublisher()
    }
}
