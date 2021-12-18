//
//  GenreAPIs.swift
//  Services
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

enum GenreAPIs {
    case genres(config: Config)
}

extension GenreAPIs: TargetType {
    
    var baseURL: URL {
        switch self {
        case .genres(let config):
            return try! config.baseURL.asURL()
        }
    }
    
    var path: String {
        switch self {
        case .genres(let config):
            return config.path("/genre/movie/list")
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .genres:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .genres(let config):
            let params: [String: Any] = ["language": "pt-br", "api_key": config.apiKey]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .genres(let config):
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
