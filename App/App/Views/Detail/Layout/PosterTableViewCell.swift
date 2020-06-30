//
//  PosterTableViewCell.swift
//  App
//
//  Created by Breno Aquino on 29/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

class PosterTableViewCell: UITableViewCell {
    
    var movie: Movie? {
        didSet{ poster.imageWithUrl(urlImage: movie?.poster, placeholder: .placeholder) }
    }
    
    // MARK: - Layout Vars
    private lazy var poster: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = .defaultCornderRadius
        return image
    }()
    
    // MARK: - Life Cycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    // MARK: - Setups
    private func setupLayout() {
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(poster)
        
        let estimatedWidth = UIScreen.main.bounds.width - abs(4 * .defaultLeading) - abs(4 * .defaultTrailing)
        poster
            .top(anchor: topAnchor, constant: .defaultTop)
            .leading(anchor: leadingAnchor, constant: 4 * .defaultLeading)
            .trailing(anchor: trailingAnchor, constant: 4 * .defaultTrailing)
            .bottom(anchor: bottomAnchor, constant: .defaultBottom)
            .height(constant: estimatedWidth / .portraitAspect)
    }
}
