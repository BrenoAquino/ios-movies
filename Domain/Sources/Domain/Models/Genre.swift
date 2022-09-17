//
//  Genre.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

public struct Genre: Hashable {
    public let id: Int
    public let name: String
    
    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
