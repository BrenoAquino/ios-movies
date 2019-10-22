//
//  HomeViewModel.swift
//  App
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Services

class HomeViewModel {
    
    // MARK: - Enum Status
    enum HomeStatus {
        case genreSuccess
        case movieSuccess
        case upcomingSuccess
        case matrixSuccess
    }
    
    enum HomeFailureStatus {
        case failure(NSError)
    }
    
    // MARK: - Vars
    var genres: [Genre]
    var movies: [Movie]
    var matrix: [Int: [Movie]]
    
    // MARK: Network Interfaces
    let genreNetwork: GenreInterface
    let discoverNetwork: DiscoverInterface
    let movieNetwork: MovieInterface
    
    // MARK: Status Callbacks
    var success: ((HomeStatus) -> Void)?
    var failure: ((HomeFailureStatus) -> Void)?
    
    // MARK: - Life Cycle
    init() {
        genres = []
        movies = []
        matrix = [:]
        
        genreNetwork = GenreInterface()
        discoverNetwork = DiscoverInterface()
        movieNetwork = MovieInterface()
    }
}

// MARK: - Network Calls
extension HomeViewModel {
    func getMatrix() {
        getGenres { [weak self] in
            guard let self = self else { return }
            let taskGroup = DispatchGroup()
            
            taskGroup.enter()
            self.getUpcoming { taskGroup.leave() }
            
            for genre in self.genres {
                taskGroup.enter()
                self.discoverNetwork.movies(genre: genre.id) { [weak self] result in
                    switch result {
                    case .success(let movies):
                        let moviesUI = movies.map { Movie(movie: $0) }
                        self?.matrix[genre.id] = moviesUI

                    case .failure(let error):
                        self?.failure?(.failure(error))
                    }
                    taskGroup.leave()
                }
            }
            
            taskGroup.notify(queue: .global()) {
                self.success?(.matrixSuccess)
            }
        }
    }
    
    func getUpcoming(completion: (() -> Void)? = nil) {
        movieNetwork.upcoming { [weak self] result in
            switch result {
            case .success(let movies):
                let moviesUI = movies.map { Movie(movie: $0) }
                self?.matrix[-1] = moviesUI
                self?.success?(.upcomingSuccess)
                
            case .failure(let error):
                self?.failure?(.failure(error))
            }
            completion?()
        }
    }
    
    func getGenres(completion: (() -> Void)? = nil) {
        genreNetwork.genres { [weak self] result in
            switch result {
            case .success(let genres):
                self?.genres = genres.map { Genre(genre: $0) }
                self?.success?(.genreSuccess)
                completion?()
                
            case .failure(let error):
                self?.failure?(.failure(error))
            }
        }
    }
    
    func getMovies(genre: Int, completion: (() -> Void)? = nil) {
        discoverNetwork.movies(genre: genre) { [weak self] result in
            switch result {
            case .success(let movies):
                let moviesUI = movies.map { Movie(movie: $0) }
                self?.matrix[genre] = moviesUI
                self?.success?(.movieSuccess)
                completion?()
                
            case .failure(let error):
                self?.failure?(.failure(error))
            }
        }
    }
}
