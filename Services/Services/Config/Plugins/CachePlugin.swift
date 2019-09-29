//
//  CachePlugin.swift
//  Services
//
//  Created by Breno Aquino on 29/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

public protocol CachePolicyAPI {
    var cachePolicy: URLRequest.CachePolicy? { get }
}

class CachePlugin: PluginType {
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        if let moyaCachePolicy = target as? CachePolicyAPI {
            var cachableRequest = request
            cachableRequest.cachePolicy = moyaCachePolicy.cachePolicy ?? .reloadIgnoringLocalCacheData
            return cachableRequest
        }
        
        var requestWitoutCache = request
        requestWitoutCache.cachePolicy = .reloadIgnoringLocalCacheData
        return requestWitoutCache
    }
}
