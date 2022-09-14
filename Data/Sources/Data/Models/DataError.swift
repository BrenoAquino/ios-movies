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
    public enum ErrorType: Int {
        // MARK: Network
        case invalidURL = -21
        case badServerResponse = -1011
        
        // MARK: Decode
        case invalidKeyPath = -31
        
        // MARK: Unkown
        case unkown = -11
    }
    
    // MARK: Variables
    private(set) var type: ErrorType
    private(set) var message: String?
    
    // MARK: Inits
    public init(type: ErrorType, message: String? = nil) {
        self.type = type
    }
    
    public init(code: Int, message: String? = nil) {
        type = ErrorType(rawValue: code) ?? .unkown
    }
}

// MARK: Domain
extension DataError {
    func toDomain() -> Domain.DomainError {
        return Domain.DomainError()
    }
}
