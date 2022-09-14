//
//  MoviesRemoteDataSourceImplTests.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import XCTest
import Combine

@testable import Data

class MoviesRemoteDataSourceImplTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = .init()
}

// MARK: - Upcoming
extension MoviesRemoteDataSourceImplTests {
    func testUpcoming() {
        // Given
        let expectation = expectation(description: "upcoming")
        let provider = TypeSpyNetworkProvider()
        let host = MockHostConfig()
        let remoteDataSource = MoviesRemoteDataSourceImpl(provider: provider, hostConfig: host)
        
        // When
        remoteDataSource
            .upcoming()
            .sink(receiveCompletion: { completion in
                expectation.fulfill()
            }, receiveValue: { _ in
            })
            .store(in: &cancellables)
        
        // Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(provider.decodableType == [Movie].self)
        XCTAssertEqual(provider.api?.hashValue(), MovieAPIs.upcoming(config: host).hashValue())
    }
}
