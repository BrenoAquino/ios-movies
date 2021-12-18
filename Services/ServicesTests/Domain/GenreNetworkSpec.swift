//
//  GenreNetworkSpec.swift
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

class GenreNetworkSpec: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("getting genres") {
            it("and returning success") { self.gettingGenresSuccess() }
            it("and returning wrong object") { self.gettingGenresWrongObject() }
            it("and returning failure") { self.gettingGenresFailure() }
        }
    }
}

// MARK: - Genres
extension GenreNetworkSpec {
    func gettingGenresSuccess() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Genre.genres, file: .genresSuccess, code: 200)
        let network = NetworkFactory.genre(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Genre], MoviesError>?

        // When
        network.genres {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beSuccess { genres in
            expect(genres.count).to(equal(19))
            expect(genres[0].id).to(equal(28))
            expect(genres[0].name).to(equal("Action"))
        })
    }
    
    func gettingGenresWrongObject() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Genre.genres, file: .genresWrongObject, code: 200)
        let network = NetworkFactory.genre(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Genre], MoviesError>?

        // When
        network.genres {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.encoding))
        })
    }
    
    func gettingGenresFailure() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Genre.genres, file: .genresFailure, code: 401)
        let network = NetworkFactory.genre(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Genre], MoviesError>?

        // When
        network.genres {
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
