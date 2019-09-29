//
//  ConfigProtocol.swift
//  Services
//
//  Created by Breno Aquino on 29/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import Foundation

protocol Config {
    var apiKey: String { get }
    var baseURL: String { get }
    var headers: [String: String]? { get }
    
    func path(_ string: String) -> String
}

extension Config {
    func path(_ string: String) -> String {
        return baseURL + string
    }
}
