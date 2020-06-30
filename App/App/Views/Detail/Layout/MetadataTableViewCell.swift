//
//  MetadataTableViewCell.swift
//  App
//
//  Created by Breno Aquino on 29/06/20.
//  Copyright © 2020 Breno Aquino. All rights reserved.
//

import UIKit

class MetadataTableViewCell: UITableViewCell {
    
    var movie: Movie? {
        didSet{
            title.text = movie?.title
            overview.text = movie?.overview
        }
    }
    
    // MARK: - Layout Vars
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var overview: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = UIColor.white.withAlphaComponent(0.9)
        label.numberOfLines = 0
        return label
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
        addSubview(title)
        addSubview(overview)
        
        title
            .top(anchor: topAnchor, constant: .defaultTop / 2)
            .leading(anchor: leadingAnchor, constant: .defaultLeading)
            .trailing(anchor: trailingAnchor, constant: .defaultTrailing)
        
        overview
            .top(anchor: title.bottomAnchor, constant: DetailStyle.topOverview)
            .leading(anchor: leadingAnchor, constant: .defaultLeading)
            .trailing(anchor: trailingAnchor, constant: .defaultTrailing)
            .bottom(anchor: bottomAnchor, constant: .defaultBottom)
    }
}
