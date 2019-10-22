//
//  MovieDBConfig.swift
//  Services
//
//  Created by Breno Aquino on 29/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation

public class MovieDBConfig: NSObject, Config {
    var apiKey: String = "9fb1244aab053cf93fa00223bef8e80f"
    var baseURL: String { return "https://api.themoviedb.org/3" }
    var headers: [String: String]? { return nil }
    
    public static var baseImageURL: String = "https://image.tmdb.org/t/p/"
}
