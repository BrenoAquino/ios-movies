//
//  CarouselHeaderView.swift
//  App
//
//  Created by Breno Aquino on 21/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit

class CarouselHeaderView: UITableViewHeaderFooterView {
    
    var text: String? {
        get { return title.text }
        set { title.text = newValue }
    }
    
    // MARK: - Layout Var
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Life Cycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(title: String, reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupLayout()
        self.title.text = title
    }
}

// MARK: - Setups
extension CarouselHeaderView {
    // Layout
    private func setupLayout() {
        contentView.addSubview(title)
        contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        title
            .top(anchor: topAnchor)
            .leading(anchor: leadingAnchor, constant: .defaultLeading)
            .trailing(anchor: trailingAnchor, constant: .defaultTrailing)
            .bottom(anchor: bottomAnchor)
    }
}
