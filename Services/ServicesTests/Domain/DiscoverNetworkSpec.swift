//
//  DiscoverNetworkSpec.swift
//  ServicesTests
//
//  Created by Breno Aquino on 18/12/21.
//  Copyright © 2021 Breno Aquino. All rights reserved.
//

import Foundation
import XCTest
import Quick
import Nimble

@testable import Services

class DiscoverNetworkSpec: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("getting movies by genre") {
            it("and returning success") { self.gettingMoviesByGenreSuccess() }
            it("and returning wrong object") { self.gettingMoviesByGenreWrongObject() }
            it("and returning failure") { self.gettingMoviesByGenreFailure() }
        }
    }
}

// MARK: Tests
extension DiscoverNetworkSpec {
    func gettingMoviesByGenreSuccess() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Discover.movies, file: .moviesSuccess, code: 200)
        let network = NetworkFactory.discover(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Movie], MoviesError>?

        // When
        network.movies(genre: .zero) {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beSuccess { movies in
            expect(movies.count).to(equal(20))
            expect(movies[0].popularity).to(equal(11147.352))
            expect(movies[0].voteCount).to(equal(836))
            expect(movies[0].hasVideo).to(beFalse())
            expect(movies[0].poster).to(equal("/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg"))
            expect(movies[0].id).to(equal(634649))
            expect(movies[0].adult).to(beFalse())
            expect(movies[0].backdrop).to(equal("/VlHt27nCqOuTnuX6bku8QZapzO.jpg"))
            expect(movies[0].originalLanguage).to(equal("en"))
            expect(movies[0].originalTitle).to(equal("Spider-Man: No Way Home"))
            expect(movies[0].genreIDs).to(equal([28, 12, 878]))
            expect(movies[0].title).to(equal("Spider-Man: No Way Home"))
            expect(movies[0].voteAverage).to(equal(8.8))
            expect(movies[0].releaseDate).to(equal("2021-12-15"))
            expect(movies[0].overview).to(equal("Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man."))
        })
    }
    
    func gettingMoviesByGenreWrongObject() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Discover.movies, file: .moviesWrongObject, code: 200)
        let network = NetworkFactory.discover(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Movie], MoviesError>?

        // When
        network.movies(genre: .zero) {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.encoding))
        })
    }
    
    func gettingMoviesByGenreFailure() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Discover.movies, file: .moviesFailure, code: 401)
        let network = NetworkFactory.discover(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Movie], MoviesError>?

        // When
        network.movies(genre: .zero) {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.unauthorized))
            expect(error.statusCode).to(equal(401))
        })
    }
}
