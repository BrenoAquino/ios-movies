//
//  DomainError.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation

public struct DomainError: Error {
    
    public enum Layer {
        case data
        case domain
    }
    
    private let layer: Layer
    private let message: String
    private let additionalInfo: String?
    
    public init(layer: Layer, message: String, additionalInfo: String? = nil) {
        self.layer = layer
        self.message = message
        self.additionalInfo = additionalInfo
    }
}
