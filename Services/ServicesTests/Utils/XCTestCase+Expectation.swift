//
//  XCTestCase+Expectation.swift
//  ServicesTests
//
//  Created by Breno Aquino on 18/12/21.
//  Copyright © 2021 Breno Aquino. All rights reserved.
//

import XCTest

extension XCTestCase {
    func defaultExpectation() -> XCTestExpectation {
        return expectation(description: "default")
    }
}
