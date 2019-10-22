//
//  Movie.swift
//  Services
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation

public struct Movie: Codable {
    
    public let popularity: Double
    public let vote_count: Int
    public let hasVideo: Bool
    public let poster: String
    public let id: Int
    public let adult: Bool
    public let backdrop: String
    public let originalLanguage: String
    public let originalTitle: String
    public let genreIDs: [Int]
    public let title: String
    public let voteAverage: Double
    public let overview: String
    public let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case popularity, vote_count, id, adult, title, overview
        case hasVideo = "video"
        case poster = "poster"
        case backdrop = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDs = "genre_ids"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}
