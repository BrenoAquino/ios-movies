//
//  MovieUI.swift
//  
//
//  Created by Breno Aquino on 15/09/22.
//

import Foundation
import Domain

struct MovieUI {
    let name: String
    let overview: String
    let poster: String
    let backposter: String
    
    init(movie: Domain.Movie) {
        name = movie.name
        overview = movie.overview
        poster = movie.poster ?? ""
        backposter = movie.backposter ?? ""
    }
}
