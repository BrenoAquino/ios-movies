//
//  UITableView+Header+Footer+Background.swift
//  Common
//
//  Created by Breno Aquino on 18/12/21.
//

import UIKit

public extension UITableView {
    func setTableHeaderViewWithAlreadyFrames(_ header: UIView) {
        let width = bounds.size.width
        let size = header.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height))
        if header.frame.size.height != size.height {
            header.frame.size.height = size.height
            tableHeaderView = header
        }
    }
    
    func setTableFooterViewWithAlreadyFrames(_ footer: UIView) {
        let width = bounds.size.width
        let size = footer.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height))
        if footer.frame.size.height != size.height {
            footer.frame.size.height = size.height
            tableFooterView = footer
        }
    }
    
    func setBackgroundView(_ view: UIView) {
        let width = bounds.size.width
        let size = view.systemLayoutSizeFitting(CGSize(width: width, height: UIView.layoutFittingCompressedSize.height))
        if view.frame.size.height != size.height {
            view.frame.size.height = size.height
            backgroundView = view
        }
    }
}
