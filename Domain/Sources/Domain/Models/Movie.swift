//
//  Movie.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

public struct Movie {
    public let name: String
    public let overview: String
    public let poster: String?
    public let backposter: String?
    
    public init(name: String, overview: String, poster: String?, backposter: String?) {
        self.name = name
        self.overview = overview
        self.poster = poster
        self.backposter = backposter
    }
}
