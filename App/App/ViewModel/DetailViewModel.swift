//
//  DetailViewModel.swift
//  App
//
//  Created by Breno Aquino on 27/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import Foundation
import Services

class DetailViewModel {
    
    // MARK: - Vars
    private var id: Int
    var movie: Movie?
    
    // MARK: Network Interfaces
    private let detailBusiness: DetailBusiness
    
    // MARK: Callbacks
    lazy var onDetailSucess: (() -> Void)? = nil
    lazy var onFailure: ((MoviesError) -> Void)? = nil
    
    // MARK: - Life Cycle
    required init(id: Int) {
        self.id = id
        movie = nil
        detailBusiness = BusinessFactory.detail()
    }
}

// MARK: - Network Calls
extension DetailViewModel {
    func detail() {
        detailBusiness.detail(id: id) { [weak self] result in
            switch result {
            case .success(let response):
                self?.movie = Movie(movie: response.0)
                self?.movie?.setKeywords(keywords: response.1)
                self?.movie?.setRecomendations(movies: response.2)
                self?.onDetailSucess?()
                
            case .failure(let error):
                self?.onFailure?(error)
            }
        }
    }
}
