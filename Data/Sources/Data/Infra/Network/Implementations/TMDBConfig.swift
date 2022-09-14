//
//  TMDBConfig.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

struct TMDBConfig: HostConfig {
    static let shared: TMDBConfig = TMDBConfig()
    
    private let apiKey: String = "9fb1244aab053cf93fa00223bef8e80f"
    let baseURL: String = "https://api.themoviedb.org/3"
    let environment: Environment = .prd
    
    private init() {}
}

extension TMDBConfig {
    var additionalQueryParams: [String : String] {
        ["api_key" : apiKey]
    }
}
