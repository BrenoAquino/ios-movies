//
//  Movie.swift
//  App
//
//  Created by Breno Aquino on 21/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Services

class Movie {
    let id: Int
    let title: String
    let poster: String
    let backdrop: String
    
    var keywords: [String]
    var recomendations: [Movie]
    
    init(movie: Services.Movie) {
        id = movie.id ?? 0
        title = movie.title ?? ""
        poster = MovieDBConfig.baseImageURL + "original" + (movie.poster ?? "")
        backdrop = MovieDBConfig.baseImageURL + "original" + (movie.backdrop ?? "")
        
        keywords = []
        recomendations = []
    }
    
    func setKeywords(keywords: [Services.Keyword]) {
        self.keywords = keywords.map({ $0.name.lowercased() })
    }
    
    func setRecomendations(movies: [Services.Movie]) {
        recomendations = movies.map({ Movie(movie: $0) })
    }
}
