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
    case discoverMovie(config: Config)
}

extension DiscoverAPI: TargetType {
    
    var baseURL: URL {
        switch self {
        case .discoverMovie(let config):
            return try! config.baseURL.asURL()
        }
    }
    
    var path: String {
        switch self {
        case .discoverMovie(let config):
            return config.path("bss/user/query/login")
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
        case .discoverMovie(let config):
            return .requestParameters(parameters: ["api_key": config.apiKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .discoverMovie(let config):
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
