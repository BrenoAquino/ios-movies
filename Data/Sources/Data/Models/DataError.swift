//
//  DataError.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

struct DataError: Error {
    
    // MARK: Types
    enum ErrorType: Int {
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
    init(type: ErrorType, message: String? = nil) {
        self.type = type
    }
    
    init(code: Int, message: String? = nil) {
        type = ErrorType(rawValue: code) ?? .unkown
    }
}
