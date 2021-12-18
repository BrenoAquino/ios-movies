//
//  DiscoverAPIs.swift
//  Services
//
//  Created by Breno Aquino on 25/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

enum DiscoverAPIs {
    case discoverMovie(genre: Int, config: Config)
}

extension DiscoverAPIs: TargetType {
    
    var baseURL: URL {
        switch self {
        case .discoverMovie(_, let config):
            return try! config.baseURL.asURL()
        }
    }
    
    var path: String {
        switch self {
        case .discoverMovie(_, let config):
            return config.path("/discover/movie")
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .discoverMovie:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .discoverMovie(let genre, let config):
            let params: [String: Any] = ["language": "pt-br", "api_key": config.apiKey, "with_genres": genre]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .discoverMovie(_, let config):
            return config.headers
        }
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var sampleData: Data {
        return Data()
    }
}
