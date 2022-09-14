//
//  File.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

#if DEBUG
import Foundation
import Domain

public extension Domain.Movie {
    static let `default`: Movie = .init(
        name: "Movie Name",
        poster: "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2670&q=80")
}

#endif
