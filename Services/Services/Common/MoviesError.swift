//
//  MoviesError.swift
//  Services
//
//  Created by Breno Aquino on 17/12/21.
//  Copyright © 2021 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

public struct MoviesError: MError {
    
    var type: MoviesErrorType
    var statusCode: Int?
    var response: Response?
    
    var message: String? {
        guard var msg = try? response?.mapString() else { return nil }
        if msg.first == "\"" {
            msg = String(msg.dropFirst())
        }
        if msg.last == "\"" {
            msg = String(msg.dropLast())
        }
        return msg
    }
    
    init() {
        self.type = .unknow
    }
    
    init(type: MoviesErrorType = .unknow) {
        self.type = type
    }
    
    init(_ error: MoyaError) {
        response = error.response
        statusCode = error.response?.statusCode
        
        let nsError = error.errorUserInfo[NSUnderlyingErrorKey] as? NSError
        switch nsError?.code {
        case NSURLErrorNotConnectedToInternet:
            type = .networkUnavaliable
        case NSURLErrorCancelled:
            type = .requestCancelled
        default:
            type = MoviesErrorType.httpError(code: statusCode)
        }
    }
}
