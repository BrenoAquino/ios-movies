//
//  HomeBusiness.swift
//  Services
//
//  Created by Breno Aquino on 26/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import Foundation

public class HomeBusiness {
    
    // MARK: - Vars
    var genres: [Genre]
    var movies: [Movie]
    var matrix: [(genre: Genre, movie: [Movie])]
    private var error: NSError?
    
    // MARK: Network Interfaces
    private let genreNetwork: GenreInterface
    private let discoverNetwork: DiscoverInterface
    private let movieNetwork: MovieInterface
    
    // MARK: - Life Cycle
    public init() {
        genres = []
        movies = []
        matrix = []
        
        genreNetwork = GenreInterface()
        discoverNetwork = DiscoverInterface()
        movieNetwork = MovieInterface()
    }
    
    // MARK: - Network Methods
    private func upcoming(task: DispatchGroup? = nil, callback: ((Result<[Movie], NSError>) -> Void)? = nil) {
        task?.enter()
        movieNetwork.upcoming { [weak self] result in
            switch result {
            case .success(let movies):
                let upcomingGenre = Genre(id: -1, name: "upcoming")
                self?.matrix.append((upcomingGenre, movies))
            case .failure(let error):
                self?.error = error
            }
            callback?(result)
            task?.leave()
        }
    }
    
    private func genres(task: DispatchGroup? = nil, callback: ((Result<[Genre], NSError>) -> Void)? = nil) {
        task?.enter()
        genreNetwork.genres { [weak self] result in
            switch result {
            case .success(let genres):
                self?.genres = genres
            case .failure(let error):
                self?.error = error
            }
            callback?(result)
            task?.leave()
        }
    }
    
    private func movies(task: DispatchGroup? = nil, genre: Genre, callback: ((Result<[Movie], NSError>) -> Void)? = nil) {
        task?.enter()
        discoverNetwork.movies(genre: genre.id) { [weak self] result in
            switch result {
            case .success(let movies):
                self?.matrix.append((genre, movies))
            case .failure(let error):
                self?.error = error
            }
            callback?(result)
            task?.leave()
        }
    }
    
    // MARK: - Interfaces
    public func home(callback: @escaping (Result<[(Genre, [Movie])], NSError>) -> Void) {
        genres = []
        movies = []
        matrix = []
        error = nil
        
        let taskGroup = DispatchGroup()
        upcoming(task: taskGroup)
        genres(task: taskGroup) { [weak self] _ in self?.genres.forEach { self?.movies(task: taskGroup, genre: $0) } }
        taskGroup.notify(queue: .global()) {
            if let error = self.error {
                callback(.failure(error))
            } else {
                callback(.success(self.matrix))
            }
        }
    }
}
