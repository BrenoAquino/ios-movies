//
//  DetailBusiness.swift
//  Services
//
//  Created by Breno Aquino on 27/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import Foundation

public class DetailBusiness {
    
    // MARK: Network Interfaces
    private let movieNetwork: MovieNetwork
    
    // MARK: - Life Cycle
    init(movieNetwork: MovieNetwork) {
        self.movieNetwork = movieNetwork
    }
    
    // MARK: - Network Methods
    private func getDetail(group: DispatchGroup? = nil, id: Int, callback: ((Result<Movie, MoviesError>) -> Void)? = nil) {
        group?.enter()
        movieNetwork.detail(id: id) { result in
            callback?(result)
            group?.leave()
        }
    }
    
    private func getKeywords(group: DispatchGroup? = nil, id: Int, callback: ((Result<[Keyword], MoviesError>) -> Void)? = nil) {
        group?.enter()
        movieNetwork.keywords(id: id) { result in
            callback?(result)
            group?.leave()
        }
    }
    
    private func getRecommendations(group: DispatchGroup? = nil, id: Int, callback: ((Result<[Movie], MoviesError>) -> Void)? = nil) {
        group?.enter()
        movieNetwork.recommendations(id: id) { result in
            callback?(result)
            group?.leave()
        }
    }
    
    // MARK: - Interfaces
    public func detail(id: Int, callback: @escaping (Result<(Movie, [Keyword], [Movie]), MoviesError>) -> Void) {
        var movie: Movie?
        var keywords: [Keyword]?
        var recommendations: [Movie]?
        var movieError: MoviesError?
        let group = DispatchGroup()
        
        getDetail(group: group, id: id) { $0.unwrapper(&movie, &movieError) }
        getKeywords(group: group, id: id) { $0.unwrapper(&keywords, &movieError) }
        getRecommendations(group: group, id: id) { $0.unwrapper(&recommendations, &movieError) }
        
        group.notify(queue: .global()) {
            if let error = movieError {
                callback(.failure(error))
            } else if let movie = movie, let keywords = keywords, let recommendations = recommendations {
                callback(.success((movie, keywords, recommendations)))
            } else {
                callback(.failure(MoviesError()))
            }
        }
    }
}
