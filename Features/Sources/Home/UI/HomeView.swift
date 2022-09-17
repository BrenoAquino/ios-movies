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
        List {
            ForEach(viewModel.carousels, id: \.genre.id) { carousel in
                generateCarousel(movies: carousel.movies)
            }
        }
        .onAppear(perform: viewModel.fetchData)
    }
    
    // MARK: Carousel
    func generateCarousel(movies: [MovieUI]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
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
        let useCase = HomeUseCasePreview()
        let viewModel = HomeViewModel(homeUseCase: useCase)
        return HomeView(viewModel: viewModel)
    }
}
#endif
