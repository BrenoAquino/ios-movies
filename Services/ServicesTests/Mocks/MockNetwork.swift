//
//  MockNetwork.swift
//  ServicesTests
//
//  Created by Breno Aquino on 18/12/21.
//  Copyright © 2021 Breno Aquino. All rights reserved.
//

import Foundation
import Moya

@testable import Services

extension TargetType {
    var hash: Int {
        var hasher = Hasher()
        hasher.combine(baseURL.hashValue)
        hasher.combine(path.hashValue)
        hasher.combine(method.hashValue)
        hasher.combine(headers?.hashValue)
        return hasher.finalize()
    }
}

class MockNetwork {
    
    var mocks: [(api: TargetType, endpoint: (TargetType) -> Endpoint)] = []
    
    // MARK: Setup Mocks
    func mock(api: TargetType, file: MockFile, code: Int) -> Self {
        let endpoint = { (target: Moya.TargetType) -> Endpoint in
            return Endpoint(
                url: target.baseURL.appendingPathComponent(target.path).absoluteString,
                sampleResponseClosure: { .networkResponse(code, file.data) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }
        mocks.append((api, endpoint))
        return self
    }
    
    // MARK: Closures
    func endpoint<T: TargetType>(for target: T) -> Endpoint {
        if let endpoint = mocks.first(where: { $0.api.hash == target.hash })?.endpoint {
            return endpoint(target)
        }
        return MoyaProvider.defaultEndpointMapping(for: target)
    }
    
    func stub<T: TargetType>(for target: T) -> StubBehavior {
        return .delayed(seconds: 0.5)
    }
}
