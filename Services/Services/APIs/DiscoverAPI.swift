//
//  DiscoverAPI.swift
//  Services
//
//  Created by Breno Aquino on 25/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

enum DiscoverAPI {
    case discoverMovie(config: Config, genre: Int)
}

extension DiscoverAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .discoverMovie(let config, _):
            return try! config.baseURL.asURL()
        }
    }
    
    var path: String {
        switch self {
        case .discoverMovie(let config, _):
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
        case .discoverMovie(let config, let genre):
            let params: [String: Any] = ["language": "pt-br", "api_key": config.apiKey, "with_genres": genre]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .discoverMovie(let config, _):
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
