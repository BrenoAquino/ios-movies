//
//  UITableView+Register.swift
//  App
//
//  Created by Breno Aquino on 29/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

extension UITableView {
    func register(cells: [AnyClass]) {
        cells.forEach({ register($0, forCellReuseIdentifier: $0.description()) })
    }
}
