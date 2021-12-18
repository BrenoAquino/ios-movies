//
//  MovieNetworkSpec.swift
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

class MovieNetworkSpec: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("getting upcoming movies") {
            it("and returning success") { self.gettingUpcomingMoviesSuccess() }
            it("and returning wrong object") { self.gettingUpcomingMoviesWrongObject() }
            it("and returning failure") { self.gettingUpcomingMoviesFailure() }
        }
        
        describe("getting movie detail") {
            it("and returning success") { self.gettingMovieDetailSuccess() }
            it("and returning wrong object") { self.gettingMovieDetailWrongObject() }
            it("and returning failure") { self.gettingMovieDetailFailure() }
        }
        
        describe("getting movie keywords") {
            it("and returning success") { self.gettingMovieKeywordsSuccess() }
            it("and returning wrong object") { self.gettingMovieKeywordsWrongObject() }
            it("and returning failure") { self.gettingMovieKeywordsFailure() }
        }
        
        describe("getting movie recommendations") {
            it("and returning success") { self.gettingRecommendationsSuccess() }
            it("and returning wrong object") { self.gettingRecommendationsWrongObject() }
            it("and returning failure") { self.gettingRecommendationsFailure() }
        }
    }
}

// MARK: - Upcoming
extension MovieNetworkSpec {
    func gettingUpcomingMoviesSuccess() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.upcoming, file: .upcomingSuccess, code: 200)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Movie], MoviesError>?

        // When
        network.upcoming {
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
            expect(movies[0].poster).to(equal("/6vVRYbIjDLMMwZJ2jo6enrdN76U.jpg"))
            expect(movies[0].id).to(equal(634649))
            expect(movies[0].adult).to(beFalse())
            expect(movies[0].backdrop).to(equal("/VlHt27nCqOuTnuX6bku8QZapzO.jpg"))
            expect(movies[0].originalLanguage).to(equal("en"))
            expect(movies[0].originalTitle).to(equal("Spider-Man: No Way Home"))
            expect(movies[0].genreIDs).to(equal([28, 12, 878]))
            expect(movies[0].title).to(equal("Homem-Aranha: Sem Volta a Casa"))
            expect(movies[0].voteAverage).to(equal(8.8))
            expect(movies[0].releaseDate).to(equal("2021-12-15"))
            expect(movies[0].overview).to(equal("Peter Parker é desmascarado e não consegue mais separar sua vida normal dos grandes riscos de ser um super-herói. Quando ele pede ajuda ao Doutor Estranho, os riscos se tornam ainda mais perigosos, e o forçam a descobrir o que realmente significa ser o Homem-Aranha."))
        })
    }
    
    func gettingUpcomingMoviesWrongObject() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.upcoming, file: .upcomingWrongObject, code: 200)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Movie], MoviesError>?

        // When
        network.upcoming {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.encoding))
        })
    }
    
    func gettingUpcomingMoviesFailure() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.upcoming, file: .upcomingFailure, code: 401)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Movie], MoviesError>?

        // When
        network.upcoming {
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

// MARK: - Detail
extension MovieNetworkSpec {
    func gettingMovieDetailSuccess() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.detail, file: .detailSuccess, code: 200)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<Movie, MoviesError>?

        // When
        network.detail(id: .zero) {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beSuccess { movies in
            expect(movies.popularity).to(equal(29.6))
            expect(movies.voteCount).to(equal(4721))
            expect(movies.hasVideo).to(beFalse())
            expect(movies.poster).to(equal("/l7rwGxhH2ZDaViuxzT0qMPfhfo3.jpg"))
            expect(movies.id).to(equal(345920))
            expect(movies.adult).to(beFalse())
            expect(movies.backdrop).to(equal("/iovi35nPfjbYTw2gRo7uImWblRU.jpg"))
            expect(movies.originalLanguage).to(equal("en"))
            expect(movies.originalTitle).to(equal("Collateral Beauty"))
            expect(movies.genreIDs).to(beNil())
            expect(movies.title).to(equal("Beleza Oculta"))
            expect(movies.voteAverage).to(equal(7.3))
            expect(movies.releaseDate).to(equal("2016-12-06"))
            expect(movies.overview).to(equal("Howard entra em depressão após uma tragédia pessoal e passa a escrever cartas para a Morte, o Tempo e o Amor, algo que preocupa seus amigos. Mas o que parece impossível, se torna realidade quando essas três partes do universo decidem responder. Morte, Tempo e Amor vão tentar ensinar o valor da vida para Howard."))
        })
    }
    
    func gettingMovieDetailWrongObject() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.detail, file: .detailWrongObject, code: 200)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<Movie, MoviesError>?

        // When
        network.detail(id: .zero) {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.encoding))
        })
    }
    
    func gettingMovieDetailFailure() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.detail, file: .detailFailure, code: 401)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<Movie, MoviesError>?

        // When
        network.detail(id: .zero) {
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

// MARK: - Keywords
extension MovieNetworkSpec {
    func gettingMovieKeywordsSuccess() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.keywords, file: .keywordsSuccess, code: 200)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Keyword], MoviesError>?

        // When
        network.keywords(id: .zero) {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beSuccess { keywords in
            expect(keywords.count).to(equal(6))
            expect(keywords[0].id).to(equal(2300))
            expect(keywords[0].name).to(equal("despair"))
        })
    }
    
    func gettingMovieKeywordsWrongObject() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.keywords, file: .keywordsWrongObject, code: 200)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Keyword], MoviesError>?

        // When
        network.keywords(id: .zero) {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.encoding))
        })
    }
    
    func gettingMovieKeywordsFailure() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.keywords, file: .keywordsFailure, code: 401)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Keyword], MoviesError>?

        // When
        network.keywords(id: .zero) {
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

// MARK: - Recommendations
extension MovieNetworkSpec {
    func gettingRecommendationsSuccess() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.recommendations, file: .recommendationsSuccess, code: 200)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Movie], MoviesError>?

        // When
        network.recommendations(id: .zero) {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beSuccess { movies in
            expect(movies.count).to(equal(21))
            expect(movies[0].popularity).to(equal(36.577))
            expect(movies[0].voteCount).to(equal(11000))
            expect(movies[0].hasVideo).to(beFalse())
            expect(movies[0].poster).to(equal("/4ttmnglFa2WxDK3yBkMX1VlpkTo.jpg"))
            expect(movies[0].id).to(equal(274870))
            expect(movies[0].adult).to(beFalse())
            expect(movies[0].backdrop).to(equal("/gHz4ZQytRs8YGrqFMwB3Vrr8pig.jpg"))
            expect(movies[0].originalLanguage).to(equal("en"))
            expect(movies[0].originalTitle).to(equal("Passengers"))
            expect(movies[0].genreIDs).to(equal([18, 10749, 878]))
            expect(movies[0].title).to(equal("Passageiros"))
            expect(movies[0].voteAverage).to(equal(6.91))
            expect(movies[0].releaseDate).to(equal("2016-12-21"))
            expect(movies[0].overview).to(equal("Uma nave espacial viajando para uma colônia em um distante planeta e transportando milhares de pessoas tem um mau funcionamento em suas câmaras do sono. Como resultado, dois passageiros são despertados 90 anos antes."))
        })
    }
    
    func gettingRecommendationsWrongObject() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.recommendations, file: .recommendationsWrongObject, code: 200)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Movie], MoviesError>?

        // When
        network.recommendations(id: .zero) {
            result = $0
            expectation.fulfill()
        }

        // Then
        waitForExpectations(timeout: 5)
        expect(result).to(beFailure { error in
            expect(error.type).to(equal(.encoding))
        })
    }
    
    func gettingRecommendationsFailure() {
        // Given
        let mock = MockNetwork()
            .mock(api: ReferenceAPIs.Movie.recommendations, file: .recommendationsFailure, code: 401)
        let network = NetworkFactory.movie(endpointClosure: mock.endpoint, stubClosure: mock.stub)
        let expectation = defaultExpectation()
        var result: Result<[Movie], MoviesError>?

        // When
        network.recommendations(id: .zero) {
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
