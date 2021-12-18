//
//  Optional+Unwrape.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import Foundation

public extension Result {
    func unwrapper<T>(_ success: inout Success?, _ failure: inout T?) {
        switch self {
        case .success(let model):
            success = model
        case .failure(let model):
            if let error = model as? T {
                failure = error
            }
        }
    }
}
