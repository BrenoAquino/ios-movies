//
//  APIsMock.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

@testable import Data

extension APIs {
    func hashValue() -> Int {
        var hash = Hasher()
        hash.combine(host.baseURL)
        hash.combine(host.additionalHeaders)
        hash.combine(host.additionalQueryParams)
        hash.combine(host.environment.hashValue)
        hash.combine(path)
        hash.combine(method.rawValue)
        hash.combine(headers)
        return hash.finalize()
    }
}

enum APIsMock {
    case get
    case post
    case delete
    case put
    case validUrl
    case invalidUrl
    case queryParams
    case headers
    case additionalHeaders
    case additionalHeadersWithEmptyHeader
    case additionalQueryParams
}

extension APIsMock: APIs {
    var host: HostConfig {
        switch self {
        case .get, .post, .delete, .put, .validUrl, .queryParams, .headers:
            return MockHostConfig(baseURL: "https://mock.com")
        case .invalidUrl:
            return MockHostConfig(baseURL: "ç")
        case .additionalHeaders, .additionalHeadersWithEmptyHeader:
            return MockHostConfig(baseURL: "https://mock.com",
                                  additionalHeaders: ["headerKey1": "customHeader"])
        case .additionalQueryParams:
            return MockHostConfig(baseURL: "https://mock.com",
                                  additionalQueryParams: ["queryKey": "queryValue"])
        }
    }
    
    var path: String {
        "path/to/be/here"
    }
    
    var method: RequestMethod {
        switch self {
        case .get,
             .validUrl,
             .invalidUrl,
             .queryParams,
             .headers,
             .additionalHeaders,
             .additionalHeadersWithEmptyHeader,
             .additionalQueryParams:
            return .get
        case .post:
            return .post
        case .delete:
            return .delete
        case .put:
            return .put
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .headers, .additionalHeaders:
            return ["headerKey1": "headerValue1", "headerKey2": "headerValue2"]
        default:
            return nil
        }
    }
    
    var queryParams: [String : Any]? {
        switch self {
        case .queryParams:
            return ["key1": "value1", "key2": 2]
        default:
            return nil
        }
    }
}
