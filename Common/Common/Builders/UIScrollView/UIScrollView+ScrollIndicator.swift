//
//  UIScrollView+ScrollIndicator.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension UIScrollView {
    
    var showsAllScrollIndicators: Bool {
        get { showsVerticalScrollIndicator && showsHorizontalScrollIndicator }
        set {
            showsVerticalScrollIndicator = newValue
            showsHorizontalScrollIndicator = newValue
        }
    }
}
