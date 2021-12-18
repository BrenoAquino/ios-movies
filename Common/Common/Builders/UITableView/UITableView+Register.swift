//
//  UITableView+Register.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension UITableView {
    
    @discardableResult
    func register(cell: AnyClass) -> Self {
        register(cell, forCellReuseIdentifier: cell.description())
        return self
    }
    
    @discardableResult
    func register(headerFooter: AnyClass) -> Self {
        register(headerFooter, forHeaderFooterViewReuseIdentifier: headerFooter.description())
        return self
    }
}
