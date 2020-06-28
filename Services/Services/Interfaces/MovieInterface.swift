//
//  MovieInterface.swift
//  Services
//
//  Created by Breno Aquino on 21/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation

class MovieInterface {
    
    private var network: Network<MovieAPI> = Network<MovieAPI>()
    private var config: MovieDBConfig = MovieDBConfig()
    
    init() {}
    
    func upcoming(callback: @escaping (Result<[Movie], NSError>) -> Void) {
        network.request(MovieAPI.upcoming(config: config)) { result in
            switch result {
            case .success(let response):
                do {
                    let movies = try response.map([Movie].self, atKeyPath: "results", using: JSONDecoder(), failsOnEmptyData: false)
                    callback(.success(movies))
                } catch let error {
                    callback(.failure(error as NSError))
                }
                
            case .failure(let error):
                callback(.failure(error as NSError))
            }
        }
    }
    
    func detail(id: Int, callback: @escaping (Result<Movie, NSError>) -> Void) {
        network.request(MovieAPI.detail(id: id, config: config)) { result in
            switch result {
            case .success(let response):
                do {
                    let movies = try response.map(Movie.self, using: JSONDecoder(), failsOnEmptyData: false)
                    callback(.success(movies))
                } catch let error {
                    callback(.failure(error as NSError))
                }
                
            case .failure(let error):
                callback(.failure(error as NSError))
            }
        }
    }
    
    func keywords(id: Int, callback: @escaping (Result<[Keyword], NSError>) -> Void) {
        network.request(MovieAPI.keywords(id: id, config: config)) { result in
            switch result {
            case .success(let response):
                do {
                    let movies = try response.map([Keyword].self, atKeyPath: "keywords", using: JSONDecoder(), failsOnEmptyData: false)
                    callback(.success(movies))
                } catch let error {
                    callback(.failure(error as NSError))
                }
                
            case .failure(let error):
                callback(.failure(error as NSError))
            }
        }
    }
    
    func recommendations(id: Int, callback: @escaping (Result<[Movie], NSError>) -> Void) {
        network.request(MovieAPI.recommendations(id: id, config: config)) { result in
            switch result {
            case .success(let response):
                do {
                    let movies = try response.map([Movie].self, atKeyPath: "results", using: JSONDecoder(), failsOnEmptyData: false)
                    callback(.success(movies))
                } catch let error {
                    callback(.failure(error as NSError))
                }
                
            case .failure(let error):
                callback(.failure(error as NSError))
            }
        }
    }
}
