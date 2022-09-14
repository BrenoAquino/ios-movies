//
//  Movie.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain

public struct Movie: Decodable {
    
    let popularity: Double?
    let voteCount: Int?
    let hasVideo: Bool?
    let poster: String?
    let id: Int?
    let adult: Bool?
    let backdrop: String?
    let originalLanguage: String?
    let originalTitle: String?
    let genreIDs: [Int]?
    let title: String?
    let voteAverage: Double?
    let overview: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case popularity, id, adult, title, overview
        case voteCount = "vote_count"
        case hasVideo = "video"
        case poster = "poster_path"
        case backdrop = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDs = "genre_ids"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}

// MARK: Domain
extension Movie {
    func toDomain() -> Domain.Movie {
        return Domain.Movie(
            name: title ?? "",
            poster: poster
        )
    }
}
