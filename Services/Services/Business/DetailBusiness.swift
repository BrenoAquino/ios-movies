//
//  DetailBusiness.swift
//  Services
//
//  Created by Breno Aquino on 27/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import Foundation

public class DetailBusiness {
    
    // MARK: - Vars
    var movie: Movie?
    var keywords: [Keyword]?
    var recommendations: [Movie]?
    private var error: MoviesError?
    
    // MARK: Network Interfaces
    private let movieNetwork: MovieNetwork
    
    // MARK: - Life Cycle
    init(movieNetwork: MovieNetwork) {
        self.movieNetwork = movieNetwork
    }
    
    // MARK: - Network Methods
    private func getDetail(task: DispatchGroup? = nil, id: Int, callback: ((Result<Movie, MoviesError>) -> Void)? = nil) {
        task?.enter()
        movieNetwork.detail(id: id) { [weak self] result in
            switch result {
            case .success(let movie):
                self?.movie = movie
            case .failure(let error):
                self?.error = error
            }
            callback?(result)
            task?.leave()
        }
    }
    
    private func getKeywords(task: DispatchGroup? = nil, id: Int, callback: ((Result<[Keyword], MoviesError>) -> Void)? = nil) {
        task?.enter()
        movieNetwork.keywords(id: id) { [weak self] result in
            switch result {
            case .success(let keywords):
                self?.keywords = keywords
            case .failure(let error):
                self?.error = error
            }
            callback?(result)
            task?.leave()
        }
    }
    
    private func getRecommendations(task: DispatchGroup? = nil, id: Int, callback: ((Result<[Movie], MoviesError>) -> Void)? = nil) {
        task?.enter()
        movieNetwork.recommendations(id: id) { [weak self] result in
            switch result {
            case .success(let recommendations):
                self?.recommendations = recommendations
            case .failure(let error):
                self?.error = error
            }
            callback?(result)
            task?.leave()
        }
    }
    
    // MARK: - Interfaces
    public func detail(id: Int, callback: @escaping (Result<(Movie, [Keyword], [Movie]), MoviesError>) -> Void) {
        movie = nil
        keywords = nil
        recommendations = nil
        error = nil
        
        let taskGroup = DispatchGroup()
        getDetail(task: taskGroup, id: id)
        getKeywords(task: taskGroup, id: id)
        getRecommendations(task: taskGroup, id: id)
        taskGroup.notify(queue: .global()) { [weak self] in
            if let error = self?.error {
                callback(.failure(error))
            } else {
                if let movie = self?.movie {
                    let model = (movie, self?.keywords ?? [], self?.recommendations ?? [])
                    callback(.success(model))
                } else {
                    callback(.failure(MoviesError()))
                }
            }
        }
    }
}
