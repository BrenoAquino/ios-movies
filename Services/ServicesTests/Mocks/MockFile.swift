//
//  MockFile.swift
//  ServicesTests
//
//  Created by Breno Aquino on 18/12/21.
//  Copyright © 2021 Breno Aquino. All rights reserved.
//

import Foundation

@testable import Services

enum MockFile: String {
    
    static var bundleId: String = "brenoaquino.ServicesTests"
    
    // MARK: Genre
    // Stats
    case genresSuccess = "genres_success"
    case genresFailure = "genres_failure"
    case genresWrongObject = "genres_wrong_object"
    
    // MARK: Discover
    // Stats
    case moviesSuccess = "movies_success"
    case moviesFailure = "movies_failure"
    case moviesWrongObject = "movies_wrong_object"
        
    // MARK: Utils
    private func dataFromFile(name: String, `extension`: String) -> Data {
        if let file = Bundle(identifier: MockFile.bundleId)?.url(forResource: name, withExtension: `extension`) {
            let json = try? String(contentsOf: file, encoding: .utf8)
            return json?.data(using: .utf8) ?? Data()
        }
        return "".data(using: .utf8) ?? Data()
    }
    
    private func dataFromFile(name: String) -> Data {
        return dataFromFile(name: name, extension: "json")
    }
    
    var data: Data {
        return dataFromFile(name: rawValue)
    }
}
