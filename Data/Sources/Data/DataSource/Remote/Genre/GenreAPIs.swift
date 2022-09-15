//
//  GenreAPIs.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

enum GenreAPIs {
    case genres(config: HostConfig)
}

extension GenreAPIs: APIs {
    var host: HostConfig {
        switch self {
        case .genres(let config):
            return config
        }
    }
    
    var path: String {
        switch self {
        case .genres:
            return "genre/movie/list"
        }
    }
    
    var method: RequestMethod {
        .get
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var queryParams: [String : Any]? {
        nil
    }
}
