//
//  Movie.swift
//  Services
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation

public struct Movie: Codable {
    
    public let popularity: Double?
    public let voteCount: Int?
    public let hasVideo: Bool?
    public let poster: String?
    public let id: Int?
    public let adult: Bool?
    public let backdrop: String?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let genreIDs: [Int]?
    public let title: String?
    public let voteAverage: Double?
    public let overview: String?
    public let releaseDate: String?
    
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
