//
//  HomeViewController.swift
//  App
//
//  Created by Breno Aquino on 25/09/19.
//  Copyright © 2019 Breno Aquino. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModel = HomeViewModel()
    
    // MARK: - Layout Vars
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MoviesCarouselTableViewCell.self, forCellReuseIdentifier: MoviesCarouselTableViewCell.description())
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupSuccessCallback()
        setupFailureCallback()
        
        viewModel.getMatrix()
    }
}

// MARK: - Setups
extension HomeViewController {
    // MARK: Layout
    private func setupLayout() {
        view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
        view.addSubview(tableView)
        tableView
            .top(anchor: view.topAnchor)
            .leading(anchor: view.leadingAnchor)
            .trailing(anchor: view.trailingAnchor)
            .bottom(anchor: view.bottomAnchor)
    }
    
    // MARK: Status
    private func setupSuccessCallback() {
        viewModel.success = { [weak self] status in
            switch status {
            case .genreSuccess, .movieSuccess:
                break
                
            case .matrixSuccess:
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    private func setupFailureCallback() {
        viewModel.failure = { status in
            switch status {
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.matrix.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let genre = viewModel.genres[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesCarouselTableViewCell.description(), for: indexPath) as! MoviesCarouselTableViewCell
        cell.movies = viewModel.matrix[genre.id] ?? []
        return cell
    }
}
