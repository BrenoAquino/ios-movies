//
//  MoviesError.swift
//  Services
//
//  Created by Breno Aquino on 17/12/21.
//  Copyright © 2021 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

enum MoviesErrorType: CaseIterable {
    // MARK: Flow
    case networkUnavaliable
    case requestCancelled
    case encoding
    case unknow
    
    // MARK: HTTP
    case unauthorized
    case tooManyRequests
    
    // MARK: Variables
    var code: Int {
        switch self {
        // Flow
        case .networkUnavaliable: return NSURLErrorNotConnectedToInternet
        case .requestCancelled: return NSURLErrorCancelled
        case .encoding: return 0
        case .unknow: return -1
            
        // HTTP
        case .unauthorized: return 401
        case .tooManyRequests: return 429
        }
    }
    
    // MARK: Create HTTP Error
    static func httpError(code: Int?) -> MoviesErrorType {
        let httpCases: [MoviesErrorType] = [.unauthorized, .tooManyRequests]
        return httpCases.first(where: { $0.code == code }) ?? .unknow
    }
}

protocol MError: Error {
    init()
    init(type: MoviesErrorType)
    init(_ error: MoyaError)
}
