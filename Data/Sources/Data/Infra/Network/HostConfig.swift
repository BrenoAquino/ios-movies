//
//  HostConfig.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

public enum Environment {
    case dev
    case prd
}

public protocol HostConfig {
    var baseURL: String { get }
    var environment: Environment { get }
    
    var additionalQueryParams: [String : String] { get }
    var additionalHeaders: [String : String] { get }
}

public extension HostConfig {
    var additionalQueryParams: [String : String] { [:] }
    var additionalHeaders: [String : String] { [:] }
}
