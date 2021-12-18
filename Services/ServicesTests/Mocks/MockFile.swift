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
    
    // MARK: Movie
    // Upcoming
    case upcomingSuccess = "upcoming_success"
    case upcomingFailure = "upcoming_failure"
    case upcomingWrongObject = "upcoming_wrong_object"
    // Detail
    case detailSuccess = "detail_success"
    case detailFailure = "detail_failure"
    case detailWrongObject = "detail_wrong_object"
    // Keywords
    case keywordsSuccess = "keywords_success"
    case keywordsFailure = "keywords_failure"
    case keywordsWrongObject = "keywords_wrong_object"
    // Recommendations
    case recommendationsSuccess = "recommendations_success"
    case recommendationsFailure = "recommendations_failure"
    case recommendationsWrongObject = "recommendations_wrong_object"
    
    // MARK: Genre
    // Genres
    case genresSuccess = "genres_success"
    case genresFailure = "genres_failure"
    case genresWrongObject = "genres_wrong_object"
    
    // MARK: Discover
    // Movies by Genre
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
