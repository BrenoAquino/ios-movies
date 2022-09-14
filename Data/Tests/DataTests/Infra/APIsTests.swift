//
//  APIsTests.swift
//
//
//  Created by Breno Aquino on 06/02/22.
//

import XCTest

@testable import Data

class APIsTests: XCTestCase {
    
    func testRequestGet() {
        // Given
        let api = APIsMock.get
        
        // When
        let request = try? api.createRequest()
        
        // Then
        XCTAssert(request?.httpMethod == "GET")
    }
    
    func testRequestPost() {
        // Given
        let api = APIsMock.post
        
        // When
        let request = try? api.createRequest()
        
        // Then
        XCTAssert(request?.httpMethod == "POST")
    }
    
    func testRequestDelete() {
        // Given
        let api = APIsMock.delete
        
        // When
        let request = try? api.createRequest()
        
        // Then
        XCTAssert(request?.httpMethod == "DELETE")
    }
    
    func testRequestPut() {
        // Given
        let api = APIsMock.put
        
        // When
        let request = try? api.createRequest()
        
        // Then
        XCTAssert(request?.httpMethod == "PUT")
    }
    
    func testValidURL() {
        // Given
        let api = APIsMock.validUrl
        
        // When
        let request = try? api.createRequest()
        
        // Then
        XCTAssert(request?.url?.absoluteString == "https://mock.com/path/to/be/here")
    }
    
    func testInvalidURL() {
        // Given
        var error: DataError?
        let api = APIsMock.invalidUrl
        
        // When
        do {
            _ = try api.createRequest()
        } catch let err {
            error = err as? DataError
        }
        
        // Then
        XCTAssertNotNil(error)
        XCTAssert(error?.type == .invalidURL)
    }
    
    func testQueryParams() {
        // Given
        let api = APIsMock.queryParams
        
        // When
        let request = try? api.createRequest()
        
        // Then
        var queryParams: [String: String] = [:]
        let queryComponents = request!.url!.query!.components(separatedBy: "&")
        for component in queryComponents {
            let keyValue = component.components(separatedBy: "=")
            queryParams[keyValue[0]] = keyValue[1]
        }
        let url = request!.url!.absoluteString.components(separatedBy: "?")[0]
        
        XCTAssert(url == "https://mock.com/path/to/be/here")
        XCTAssert(queryParams["key1"] == "value1")
        XCTAssert(queryParams["key2"] == "2")
    }
    
    func testAddiotanlQuery() {
        // Given
        let api = APIsMock.additionalQueryParams
        
        // When
        let request = try? api.createRequest()
        
        // Then
        var queryParams: [String: String] = [:]
        let queryComponents = request!.url!.query!.components(separatedBy: "&")
        for component in queryComponents {
            let keyValue = component.components(separatedBy: "=")
            queryParams[keyValue[0]] = keyValue[1]
        }
        let url = request!.url!.absoluteString.components(separatedBy: "?")[0]
        
        XCTAssert(url == "https://mock.com/path/to/be/here")
        XCTAssert(queryParams["queryKey"] == "queryValue")
    }
    
    func testHeaders() {
        // Given
        let api = APIsMock.headers
        
        // When
        let request = try? api.createRequest()
        
        // Then
        XCTAssert(request?.allHTTPHeaderFields?["headerKey1"] == "headerValue1")
        XCTAssert(request?.allHTTPHeaderFields?["headerKey2"] == "headerValue2")
    }
    
    func testAddiotanlHeaders() {
        // Given
        let api = APIsMock.additionalHeaders
        
        // When
        let request = try? api.createRequest()
        
        // Then
        XCTAssert(request?.allHTTPHeaderFields?["headerKey1"] == "customHeader")
        XCTAssert(request?.allHTTPHeaderFields?["headerKey2"] == "headerValue2")
    }
    
    func testAddiotanlHeadersWithEmptyHeaders() {
        // Given
        let api = APIsMock.additionalHeaders
        
        // When
        let request = try? api.createRequest()
        
        // Then
        XCTAssert(request?.allHTTPHeaderFields?["headerKey1"] == "customHeader")
    }
}
