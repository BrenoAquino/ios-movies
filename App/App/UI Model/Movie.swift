//
//  Movie.swift
//  App
//
//  Created by Breno Aquino on 21/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Services

struct Movie {
    let title: String
    let poster: String
    let backdrop: String
    
    init(movie: Services.Movie) {
        title = movie.title ?? ""
        poster = MovieDBConfig.baseImageURL + "original" + (movie.poster ?? "")
        backdrop = MovieDBConfig.baseImageURL + "original" + (movie.backdrop ?? "")
    }
}
