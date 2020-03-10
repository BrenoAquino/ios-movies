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
    
    // MARK: - Vars
    var genres: [Genre]
    var movies: [Movie]
    var matrix: [Int: [Movie]]
    
    // MARK: Network Interfaces
    let genreNetwork: GenreInterface
    let discoverNetwork: DiscoverInterface
    let movieNetwork: MovieInterface
    
    // MARK: Callbacks
    var onGenreSuccess: (() -> Void)?
    var onMoviesSucess: (() -> Void)?
    var onUpcomingSucess: (() -> Void)?
    var onHomeSucess: (() -> Void)?
    var onFailure: ((NSError) -> Void)?
    
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
    func home() {
        genres { [weak self] in
            guard let self = self else { return }
            let taskGroup = DispatchGroup()
            self.upcoming(task: taskGroup)
            self.genres.forEach({ self.movies(task: taskGroup, genre: $0.id) })
            taskGroup.notify(queue: .global()) {
                self.onHomeSucess?()
            }
        }
    }
    
    func upcoming(task: DispatchGroup? = nil) {
        task?.enter()
        movieNetwork.upcoming { [weak self] result in
            switch result {
            case .success(let movies):
                let moviesUI = movies.map { Movie(movie: $0) }
                self?.matrix[-1] = moviesUI
                self?.onUpcomingSucess?()
                
            case .failure(let error):
                self?.onFailure?(error)
            }
            task?.leave()
        }
    }
    
    func genres(task: DispatchGroup? = nil, completion: (() -> Void)? = nil) {
        task?.enter()
        genreNetwork.genres { [weak self] result in
            switch result {
            case .success(let genres):
                self?.genres = genres.map { Genre(genre: $0) }
                self?.onGenreSuccess?()
                
            case .failure(let error):
                self?.onFailure?(error)
            }
            completion?()
            task?.leave()
        }
    }
    
    func movies(task: DispatchGroup? = nil, genre: Int) {
        task?.enter()
        discoverNetwork.movies(genre: genre) { [weak self] result in
            switch result {
            case .success(let movies):
                let moviesUI = movies.map { Movie(movie: $0) }
                self?.matrix[genre] = moviesUI
                self?.onMoviesSucess?()
                
            case .failure(let error):
                self?.onFailure?(error)
            }
            task?.leave()
        }
    }
}
