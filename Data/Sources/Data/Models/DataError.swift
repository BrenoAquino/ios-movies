//
//  DataError.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import Domain

public struct DataError: Error {
    
    // MARK: Types
    public enum ErrorType {
        // MARK: Network
        case invalidURL
        case badServerResponse
        
        // MARK: Decode
        case invalidKeyPath
        
        // MARK: Unkown
        case unkown
    }
    
    // MARK: Variables
    private(set) var type: ErrorType
    private(set) var message: String
    private(set) var additionalInfo: String
    
    // MARK: Inits
    private init(type: ErrorType, message: String, additionalInfo: String) {
        self.type = type
        self.message = message
        self.additionalInfo = additionalInfo
    }
    
    public init(type: ErrorType, message: String, url: String?) {
        let additioalInfo = "URL: \(url ?? "nil")"
        self.init(type: type, message: message, additionalInfo: additioalInfo)
    }
    
    public init(type: ErrorType, message: String, url: URL?) {
        let additioalInfo = "URL: \(url?.absoluteString ?? "nil")"
        self.init(type: type, message: message, additionalInfo: additioalInfo)
    }
    
    public init(type: ErrorType, message: String, endpoint: APIs) {
        let request = try? endpoint.createRequest()
        let additionalInfo = "URL: \(request?.url?.absoluteString ?? "nil")"
        self.init(type: type, message: message, additionalInfo: additionalInfo)
    }
}

// MARK: Domain
extension DataError {
    func toDomain() -> Domain.DomainError {
        return Domain.DomainError(layer: .data, message: message, additionalInfo: additionalInfo)
    }
}
