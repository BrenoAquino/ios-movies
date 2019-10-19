//
//  NetworkProvider.swift
//  Services
//
//  Created by Breno Aquino on 29/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

class Network<TT: TargetType>: MoyaProvider<TT> {
    
    public init(plugins: [PluginType] = [], endpointClosure: @escaping (TT) -> Endpoint = MoyaProvider.defaultEndpointMapping) {
        var customPlugins: [PluginType] = plugins
        customPlugins.append(CachePlugin())
        
        if Session.isMock {
            super.init(stubClosure: MoyaProvider<TT>.immediatelyStub, plugins: customPlugins)
        } else {
            super.init(plugins: customPlugins)
        }
    }
}

enum Session {
    public static var isMock: Bool {
        #if DEBUG
        return false
        #else
        return false
        #endif
    }
}
