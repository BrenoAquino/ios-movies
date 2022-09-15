//
//  DiscoverAPIs.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

enum DiscoverAPIs {
    case discoverMovie(config: HostConfig, genre: Int)
}

extension DiscoverAPIs: APIs {
    var host: HostConfig {
        switch self {
        case .discoverMovie(let config, _):
            return config
        }
    }
    
    var path: String {
        switch self {
        case .discoverMovie:
            return "discover/movie"
        }
    }
    
    var method: RequestMethod {
        .get
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryParams: [String : Any]? {
        switch self {
        case .discoverMovie(_, let genre):
            return ["with_genres": genre]
        }
    }
}
