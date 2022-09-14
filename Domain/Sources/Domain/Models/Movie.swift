//
//  Movie.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

public struct Movie {
    public let name: String
    public let poster: String?
    
    public init(name: String, poster: String?) {
        self.name = name
        self.poster = poster
    }
}
