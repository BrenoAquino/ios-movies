//
//  HomeView.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import SwiftUI
import DesignSystem

public struct HomeView: View {
    
    // MARK: - Constants
    private static let posterHeight: CGFloat = 200
    
    // MARK: - Proprieties
    @ObservedObject private var viewModel: HomeViewModel
    
    public init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    public var body: some View {
        state
            .onAppear(perform: viewModel.fetchData)
    }
    
    private var state: some View {
        ZStack {
            switch viewModel.state {
            case .loading:
                ViewState.loadingView(background: .opaque)
            case .failure:
                Text("Error")
            case .content:
                content
            default:
                EmptyView()
            }
        }
    }
    
    // MARK: Content
    private var content: some View {
        List {
            ForEach(viewModel.carousels, id: \.genre.id) { carousel in
                Section {
                    generateCarousel(movies: carousel.movies)
                } header: {
                    Text(carousel.genre.name)
                        .padding(.horizontal, 16)
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(PlainListStyle())
    }
    
    // MARK: Carousel
    private func generateCarousel(movies: [MovieUI]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 8) {
                ForEach(movies, id: \.name) { elem in
                    posterView(movie: elem)
                }
            }
            .padding(.horizontal, 8)
        }
    }
    
    private func posterView(movie: MovieUI) -> some View {
        PosterView(movie: movie)
            .frame(
                width: Self.posterHeight * CGSize.portrait.proportionWH,
                height: Self.posterHeight
            )
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
