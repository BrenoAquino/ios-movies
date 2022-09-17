//
//  CarouselUI.swift
//  
//
//  Created by Breno Aquino on 17/09/22.
//

import Foundation
import Domain
import SwiftUI

struct CarouselUI {
    let genre: GenreUI
    let movies: [MovieUI]
    
    init(genre: Domain.Genre, movies: [Domain.Movie]) {
        self.genre = GenreUI(genre: genre)
        self.movies = movies.map { MovieUI(movie: $0) }
    }
}
