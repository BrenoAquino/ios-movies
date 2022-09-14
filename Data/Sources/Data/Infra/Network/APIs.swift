//
//  APIs.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

protocol APIs {
    var host: HostConfig { get }
    var path: String { get }
    var method: RequestMethod { get }
    var headers: [String : String]? { get }
    var queryParams: [String : Any]? { get }
}

extension APIs {
    private func generateQueryItems(params: [String : Any]?, additional: [String : Any]) -> [URLQueryItem]? {
        var items: [URLQueryItem] = []
        
        if let params = params {
            for (key, value) in params {
                items.append(
                    .init(name: key, value: String(describing: value))
                )
            }
        }
        
        for (key, value) in additional {
            items.append(
                .init(name: key, value: String(describing: value))
            )
        }
        
        return items.isEmpty ? nil : items
    }
    
    private func generateHeaders(headers: [String : String]?, additional: [String : String]) -> [String : String]? {
        var allHeaders: [String : String] = [:]
        if let headers = headers {
            allHeaders = headers
            allHeaders.merge(additional) { (_, new) in new }
        } else {
            allHeaders = additional
        }
        return allHeaders
    }
    
    func createRequest() throws -> URLRequest {
        guard var components = URLComponents(string: host.baseURL + "/" + path) else {
            throw DataError(type: .invalidURL)
        }
        
        components.queryItems = generateQueryItems(params: queryParams, additional: host.additionalQueryParams)
        guard let url = components.url else {
            throw DataError(type: .invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = generateHeaders(headers: headers, additional: host.additionalHeaders)
        return request
    }
}
