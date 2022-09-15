//
//  Genre.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain

public struct Genre: Codable {
    public let id: Int
    public let name: String
}

// MARK: Domain
extension Genre {
    func toDomain() -> Domain.Genre {
        return Domain.Genre(
            id: id,
            name: name
        )
    }
}
