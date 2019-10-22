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
        tableView.register(CarouselHeaderView.self, forHeaderFooterViewReuseIdentifier: CarouselHeaderView.description())
        tableView.register(UpcomingTableViewCell.self, forCellReuseIdentifier: UpcomingTableViewCell.description())
        tableView.register(MoviesCarouselTableViewCell.self, forCellReuseIdentifier: MoviesCarouselTableViewCell.description())
        tableView.backgroundColor = .black
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInset = .zero
        return tableView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
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
        view.addSubview(tableView)
        view.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
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
            case .genreSuccess, .movieSuccess, .upcomingSuccess:
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
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - TableView
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.matrix.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard section != 0 else { return .leastNonzeroMagnitude }
        return HomeStyle.carouselHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return HomeStyle.movieSpacing
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.section != 0 else { return UIScreen.main.bounds.width / .landscapeAspect }
        return HomeStyle.carouselHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section != 0 else { return nil }
        let genre = viewModel.genres[section - 1]
        let view = CarouselHeaderView(title: genre.name, reuseIdentifier: CarouselHeaderView.description())
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.description(), for: indexPath) as! UpcomingTableViewCell
            cell.movies = viewModel.matrix[-1] ?? []
            return cell
        }
        
        let genre = viewModel.genres[indexPath.section - 1]
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesCarouselTableViewCell.description(), for: indexPath) as! MoviesCarouselTableViewCell
        cell.movies = viewModel.matrix[genre.id] ?? []
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? UpcomingTableViewCell else { return }
        cell.stopTimer()
    }
}
