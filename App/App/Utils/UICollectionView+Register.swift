//
//  UICollectionView+Register.swift
//  App
//
//  Created by Breno Aquino on 10/07/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(cells: [AnyClass]) {
        cells.forEach({ register($0, forCellWithReuseIdentifier: $0.description()) })
    }
}
