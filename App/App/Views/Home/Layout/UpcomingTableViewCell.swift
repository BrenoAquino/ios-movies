//
//  UpcomingTableViewCell.swift
//  App
//
//  Created by Breno Aquino on 21/10/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell {
    
    var movies: [Movie] = [] {
        didSet { collectionView.reloadData() }
    }
    
    var timer: Timer?
    
    // MARK: - Layout View
    private var totalItens: Int { return movies.isEmpty ? 0 : 1_000_000 }
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / .landscapeAspect )
        layout.minimumLineSpacing = .leastNonzeroMagnitude
        layout.minimumInteritemSpacing = .leastNonzeroMagnitude
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UpcomingCollectionViewCell.self, forCellWithReuseIdentifier: UpcomingCollectionViewCell.description())
        collectionView.isPagingEnabled = true
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if  currentCollectionIndex(collectionView) < totalItens / 10 || currentCollectionIndex(collectionView) > 9 * totalItens / 10 {
            moveToContentOffset(collectionView: collectionView, index: totalItens/2, animated: false)
        }
        setupTimer()
    }
}

// MARK: - Setup
extension UpcomingTableViewCell {
    // MARK: Layout
    private func setupLayout() {
        addSubview(collectionView)
        subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        collectionView
            .top(anchor: topAnchor)
            .leading(anchor: leadingAnchor)
            .trailing(anchor: trailingAnchor)
            .bottom(anchor: bottomAnchor)
    }
    
    // MARK: Timer
    private func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { [weak self] _ in
            guard let collectionView = self?.collectionView else { return }
            DispatchQueue.main.async {
                self?.moveToNextItem(collectionView)
            }
        })
    }
    
    func stopTimer() {
        timer = nil
    }
}

// MARK: - Automatic Movie
extension UpcomingTableViewCell {
    private func currentCollectionIndex(_ collectionView: UICollectionView) -> Int {
        return Int(collectionView.contentOffset.x / UIScreen.main.bounds.width)
    }
    
    private func positionOf(index: Int) -> CGFloat {
        return CGFloat(index) * UIScreen.main.bounds.width
    }
    
    private func moveToNextItem(_ collectionView: UICollectionView) {
        let currentItem = currentCollectionIndex(collectionView)
        let nextItem = currentItem + 1
        if nextItem >= totalItens { return }
        moveToContentOffset(collectionView: collectionView, index: nextItem, animated: true)
    }
    
    private func moveToContentOffset(collectionView: UICollectionView, index: Int, animated: Bool) {
        let position: CGFloat = positionOf(index: index)
        collectionView.setContentOffset(CGPoint(x: position,
                                                y: collectionView.contentOffset.y),
                                        animated: animated)
    }
}

// MARK: - CollectionView
extension UpcomingTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalItens
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.description(), for: indexPath) as! UpcomingCollectionViewCell
        cell.movie = movies[indexPath.row % movies.count]
        return cell
    }
}