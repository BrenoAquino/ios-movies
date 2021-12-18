//
//  SGFont+Extensions.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension UILabel {
    @discardableResult
    func font(_ sgFont: SGFont) -> Self {
        font = sgFont.rawValue
        return self
    }
}

public extension UITextField {
    @discardableResult
    func font(_ sgFont: SGFont) -> Self {
        font = sgFont.rawValue
        return self
    }
}
