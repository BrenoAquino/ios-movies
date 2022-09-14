//
//  HomeView.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import SwiftUI

public struct HomeView: View {
    
    @ObservedObject private var viewModel: HomeViewModel
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    public var body: some View {
        carousel(movies: viewModel.movies)
            .onAppear(perform: viewModel.fetchData)
    }
    
    // MARK: Carousel
    func carousel(movies: [MovieUI]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(movies, id: \.name) { elem in
                    PosterView(movie: elem)
                        .frame(width: 150)
                }
            }
            .padding(.horizontal, 8)
        }
    }
}

#if DEBUG
import Previews

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let useCase = HomeUserCasePreview()
        let viewModel = HomeViewModel(homeUseCase: useCase)
        return HomeView(viewModel: viewModel)
    }
}
#endif
