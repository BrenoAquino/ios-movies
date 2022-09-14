//
//  MockHostConfig.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

@testable import Data

struct MockHostConfig: HostConfig {
    let environment: Environment = .dev
    
    let baseURL: String
    var additionalQueryParams: [String : String]
    var additionalHeaders: [String : String]
    
    init(baseURL: String = "",
         additionalQueryParams: [String : String] = [:],
         additionalHeaders: [String : String] = [:]) {
        self.baseURL = baseURL
        self.additionalQueryParams = additionalQueryParams
        self.additionalHeaders = additionalHeaders
    }
}
