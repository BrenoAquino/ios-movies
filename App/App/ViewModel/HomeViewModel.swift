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
    lazy var onFailure: ((NSError) -> Void)? = nil
    
    // MARK: - Life Cycle
    init() {
        contents = []
        homeBusiness = HomeBusiness()
    }
}

// MARK: - Network Calls
extension HomeViewModel {
    func home() {
        homeBusiness.home { [weak self] result in
            switch result {
            case .success(let movies):
                self?.contents = []
                movies.sorted(by: { $0.0.id < $1.0.id }).forEach { (element) in
                    let genre = Genre(genre: element.0)
                    let movies = element.1.map { Movie(movie: $0) }
                    self?.contents.append((genre, movies))
                }
                self?.onHomeSucess?()
            case .failure(let error):
                self?.onFailure?(error)
            }
        }
    }}
