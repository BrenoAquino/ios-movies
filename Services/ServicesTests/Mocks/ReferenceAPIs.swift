//
//  ReferenceAPIs.swift
//  ServicesTests
//
//  Created by Breno Aquino on 18/12/21.
//  Copyright © 2021 Breno Aquino. All rights reserved.
//

import Foundation

@testable import Services

enum ReferenceAPIs {
    
    private static let config = MovieDBConfig()
    
    enum Genre {
        static let genres = GenreAPIs.genres(config: ReferenceAPIs.config)
    }
    
    enum Discover {
        static let movies = DiscoverAPIs.discoverMovie(genre: .zero, config: ReferenceAPIs.config)
    }
    
    enum Movie {
        static let upcoming = MovieAPIs.upcoming(config: ReferenceAPIs.config)
        static let detail = MovieAPIs.detail(id: .zero, config: ReferenceAPIs.config)
        static let keywords = MovieAPIs.keywords(id: .zero, config: ReferenceAPIs.config)
        static let recommendations = MovieAPIs.recommendations(id: .zero, config: ReferenceAPIs.config)
    }
}
