//
//  MovieCollectionViewCell.swift
//  App
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    var movie: Movie? {
        didSet { rebind() }
    }
    
    // MARK: - Layout Var
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = .defaultCornderRadius
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: - Life Cycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
}

// MARK: - Setups
extension MovieCollectionViewCell {
    // MARK: Layout
    private func setupLayout() {
        addSubview(imageView)
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        imageView
            .top(anchor: topAnchor)
            .leading(anchor: leadingAnchor)
            .trailing(anchor: trailingAnchor)
            .bottom(anchor: bottomAnchor)
    }
    
    // MARK: Bind
    private func rebind() {
        imageView.imageWithUrl(urlImage: movie?.poster, placeholder: .placeholder)
    }
}
