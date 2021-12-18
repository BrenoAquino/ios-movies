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
    var contents: [(genre: Genre, movies: [Movie])]
    
    // MARK: Network Interfaces
    let homeBusiness: HomeBusiness
    
    // MARK: Callbacks
    lazy var onHomeSucess: (() -> Void)? = nil
    lazy var onFailure: ((MoviesError) -> Void)? = nil
    
    // MARK: - Life Cycle
    init() {
        contents = []
        homeBusiness = BusinessFactory.home()
    }
}

// MARK: - Network Calls
extension HomeViewModel {
    func home() {
        homeBusiness.home { [weak self] result in
            switch result {
            case .success(let carousels):
                self?.contents = []
                carousels.sorted(by: { $0.genre.id < $1.genre.id }).forEach { carousel in
                    let genre = Genre(genre: carousel.genre)
                    let movies = carousel.movies.map { Movie(movie: $0) }
                    self?.contents.append((genre, movies))
                }
                self?.onHomeSucess?()
                
            case .failure(let error):
                self?.onFailure?(error)
            }
        }
    }
}
