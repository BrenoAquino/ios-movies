//
//  MovieUI.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain

struct MovieUI {
    let name: String
    let poster: String
    
    init(name: String, poster: String) {
        self.name = name
        self.poster = poster
    }
    
    init(movie: Domain.Movie) {
        self.name = movie.name
        self.poster = movie.poster ?? ""
    }
}
