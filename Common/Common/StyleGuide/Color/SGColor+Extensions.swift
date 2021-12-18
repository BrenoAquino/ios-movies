//
//  SGColor+Extensions.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension UILabel {
    @discardableResult
    func textColor(_ color: SGColor) -> Self {
        textColor = color.rawValue
        return self
    }
}

public extension UITextField {
    @discardableResult
    func textColor(_ color: SGColor) -> Self {
        textColor = color.rawValue
        return self
    }
}

public extension UIView {
    @discardableResult
    func backgroundColor(_ color: SGColor) -> Self {
        backgroundColor = color.rawValue
        return self
    }
}
