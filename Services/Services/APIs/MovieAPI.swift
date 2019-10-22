//
//  MovieAPI.swift
//  Services
//
//  Created by Breno Aquino on 21/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

enum MovieAPI {
    case upcoming(config: Config)
}

extension MovieAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .upcoming(let config):
            return try! config.baseURL.asURL()
        }
    }
    
    var path: String {
        switch self {
        case .upcoming(let config):
            return config.path("/movie/upcoming")
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .upcoming:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .upcoming(let config):
            let params: [String: Any] = ["language": "pt-br", "api_key": config.apiKey]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .upcoming(let config):
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
