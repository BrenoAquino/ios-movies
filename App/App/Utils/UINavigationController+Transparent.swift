//
//  UINavigationController+Transparent.swift
//  App
//
//  Created by Breno Aquino on 29/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    func setTransparent(to state: Bool) {
//        shadowImage = state ? UIImage(cgImage: UIColor.clear.cgColor) : nil
        shadowImage = UIImage()
        isTranslucent = state
        setBackgroundImage(state ? UIImage() : nil, for: .default)
    }
}
