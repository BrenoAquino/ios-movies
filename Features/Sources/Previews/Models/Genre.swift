//
//  File.swift
//  
//
//  Created by Breno Aquino on 17/09/22.
//

#if DEBUG
import Foundation
import Domain

public extension Domain.Genre {
    static let action: Genre = .init(id: 1, name: "Action")
    static let drama: Genre = .init(id: 2, name: "Drama")
    static let commedy: Genre = .init(id: 3, name: "Commedy")
    static let horror: Genre = .init(id: 4, name: "Horror")
}
#endif
