//
//  DetailView.swift
//  
//
//  Created by Breno Aquino on 15/09/22.
//

import SwiftUI
import DesignSystem

public struct DetailView: View {
    
    @ObservedObject private var viewModel: DetailViewModel
    
    public init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    public var body: some View {
        ZStack(alignment: .top) {
            background
            content
        }
        .onAppear(perform: viewModel.fetchData)
    }
    
    private var content: some View {
        VStack(spacing: 16) {
            poster
            Text(viewModel.movie?.name ?? "")
                .font(.largeTitle)
                .fontWeight(.medium)
            Text(viewModel.movie?.overview ?? "")
                .font(.body)
                .fontWeight(.medium)
        }
        .padding(.all, 16)
    }
    
    // MARK: Header
    private var poster: some View {
        CachedAsyncImage(
            image: viewModel.movie?.poster ?? "",
            placeholder: {
                ProgressView()
                    .padding(16)
                    .frame(
                        width: 100 * CGSize.portrait.proportionWH,
                        height: 100
                    )
                    .background(Color.black)
            }, content: { image in
                image
                    .resizable()
                    .aspectRatio(CGSize.portrait, contentMode: .fit)
                    .frame(height: 240)
            }
        )
    }
    
    // MARK: Background
    private var background: some View {
        GeometryReader { geometry in
            CachedAsyncImage(
                image: viewModel.movie?.poster ?? "",
                placeholder: {
                    ProgressView()
                        .padding(16)
                        .frame(
                            width: geometry.size.width,
                            height: geometry.size.height
                        )
                        .background(Color.black)
                }, content: { image in
                    image
                        .resizable()
                        .aspectRatio(CGSize.portrait, contentMode: .fill)
                        .overlay(.ultraThinMaterial)
                }
            )
        }
    }
}

#if DEBUG
import Previews

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let useCase = DetailUseCasePreview()
        let viewModel = DetailViewModel(useCase: useCase, contentId: .zero)
        return DetailView(viewModel: viewModel)
    }
}
#endif
