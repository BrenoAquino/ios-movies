//
//  UITableView+Dequeue.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.description(), for: indexPath) as? T
    }
}
