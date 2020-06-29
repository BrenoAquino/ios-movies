//
//  MoviesCarouselTableViewCell.swift
//  App
//
//  Created by Breno Aquino on 18/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit

protocol MoviesCarouselDelegate: class {
    func didSelect(movie: Movie)
}

class MoviesCarouselTableViewCell: UITableViewCell {
    
    weak var delegate: MoviesCarouselDelegate?
    var movies: [Movie] = [] {
        didSet { collectionView.reloadData() }
    }
    
    // MARK: - Layout View
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: HomeStyle.carouselHeight * .portraitAspect, height: HomeStyle.carouselHeight)
        layout.minimumInteritemSpacing = HomeStyle.movieSpacing
        layout.sectionInset = UIEdgeInsets(top: 0, left: .defaultSpacing, bottom: 0, right: .defaultSpacing)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isUserInteractionEnabled = true
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.description())
        return collectionView
    }()
    
    // MARK: - Life Cycle
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
}

// MARK: - Setup
extension MoviesCarouselTableViewCell {
    // MARK: Layout
    func setupLayout() {
        contentView.addSubview(collectionView)
        contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        collectionView
            .top(anchor: contentView.topAnchor)
            .leading(anchor: contentView.leadingAnchor)
            .trailing(anchor: contentView.trailingAnchor)
            .bottom(anchor: contentView.bottomAnchor)
    }
}

// MARK: - CollectionView
extension MoviesCarouselTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.description(), for: indexPath) as! MovieCollectionViewCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(movie: movies[indexPath.row])
    }
}
