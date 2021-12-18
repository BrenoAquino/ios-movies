//
//  HomeBusiness.swift
//  Services
//
//  Created by Breno Aquino on 26/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import Foundation
import Common

public class HomeBusiness {
    
    public struct Carousel {
        public let genre: Genre
        public let movies: [Movie]
    }
    
    // MARK: Network Interfaces
    private let genreNetwork: GenreNetwork
    private let discoverNetwork: DiscoverNetwork
    private let movieNetwork: MovieNetwork
    
    // MARK: - Life Cycle
    init(genreNetwork: GenreNetwork, discoverNetwork: DiscoverNetwork, movieNetwork: MovieNetwork) {
        self.genreNetwork = genreNetwork
        self.discoverNetwork = discoverNetwork
        self.movieNetwork = movieNetwork
    }
    
    // MARK: - Network Methods
    private func upcoming(group: DispatchGroup? = nil, callback: ((Result<[Movie], MoviesError>) -> Void)? = nil) {
        group?.enter()
        movieNetwork.upcoming { result in
            callback?(result)
            group?.leave()
        }
    }
    
    private func genres(group: DispatchGroup? = nil, callback: ((Result<[Genre], MoviesError>) -> Void)? = nil) {
        group?.enter()
        genreNetwork.genres { result in
            callback?(result)
            group?.leave()
        }
    }
    
    private func movies(group: DispatchGroup? = nil, genre: Int, callback: ((Result<[Movie], MoviesError>) -> Void)? = nil) {
        group?.enter()
        discoverNetwork.movies(genre: genre) { result in
            callback?(result)
            group?.leave()
        }
    }
    
    // MARK: - Interfaces
    public func home(callback: @escaping (Result<[Carousel], MoviesError>) -> Void) {
        var carousels: [Carousel] = []
        var movieError: MoviesError? = nil
        let group = DispatchGroup()
        
        upcoming(group: group) { result in
            switch result {
            case .success(let movies):
                let genre = Genre(id: -1, name: "upcoming")
                let carousel = Carousel(genre: genre, movies: movies)
                carousels.append(carousel)
            case .failure(let error):
                movieError = error
            }
        }
        
        let carouselGenre: (Genre) -> Void = { [weak self] genre in
            self?.movies(group: group, genre: genre.id) { result in
                guard let movies = try? result.get() else { return }
                let carousel = Carousel(genre: genre, movies: movies)
                carousels.append(carousel)
            }
        }
        
        genres(group: group) { result in
            switch result {
            case .success(let genres):
                genres.forEach { carouselGenre($0) }
            case .failure(let error):
                movieError = error
            }
        }
        
        group.notify(queue: .global()) {
            if let error = movieError {
                callback(.failure(error))
            } else {
                callback(.success(carousels))
            }
        }
    }
}
