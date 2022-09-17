//
//  MovieAPIs.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

enum MovieAPIs {
    case upcoming(config: HostConfig)
    case detail(config: HostConfig, id: Int)
}

extension MovieAPIs: APIs {
    var host: HostConfig {
        switch self {
        case .upcoming(let config),
             .detail(let config, _):
            return config
        }
    }
    
    var path: String {
        switch self {
        case .upcoming:
            return "movie/upcoming"
        case .detail(_, let id):
            return "movie/\(id)"
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
