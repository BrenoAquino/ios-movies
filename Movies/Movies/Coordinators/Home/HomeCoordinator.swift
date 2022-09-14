//
//  HomeCoordinator.swift
//  Movies
//
//  Created by Breno Aquino on 14/09/22.
//

import SwiftUI
import Home

struct HomeCoordinator: View {
    
    // MARK: Coordinator
    @ObservedObject var viewModel: HomeCoordinatorViewModel
    
    init(viewModel: HomeCoordinatorViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: Self View
    var body: some View {
        HomeView(viewModel: viewModel.homeViewModel)
    }
    
    // MARK: Navigations Links
}
