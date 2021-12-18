//
//  SGSpace+Extensions.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

extension UIEdgeInsets {
    init(top: SGVerticalSpace, left: SGHorizontalSpace, bottom: SGVerticalSpace, right: SGHorizontalSpace) {
        self.init(top: top.rawValue, left: left.rawValue, bottom: bottom.rawValue, right: right.rawValue)
    }
}
