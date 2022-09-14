//
//  HostConfig.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

enum Environment {
    case dev
    case prd
}

protocol HostConfig {
    var baseURL: String { get }
    var environment: Environment { get }
    
    var additionalQueryParams: [String : String] { get }
    var additionalHeaders: [String : String] { get }
}

extension HostConfig {
    var additionalQueryParams: [String : String] { [:] }
    var additionalHeaders: [String : String] { [:] }
}
