//
//  PosterView.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import SwiftUI
import DesignSystem

struct PosterView: View {
    
    let movie: MovieUI
    
    var body: some View {
        GeometryReader { geometry in
            CachedAsyncImage(
                image: movie.poster,
                placeholder: {
                    VStack(spacing: 16) {
                        ProgressView()
                        Text(movie.name)
                            .multilineTextAlignment(.center)
                    }
                    .padding(16)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color.gray)
                },
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(CGSize.portrait, contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                })
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
    }
}

#if DEBUG
import Previews

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(movie: MovieUI(movie: .default))
            .previewLayout(.sizeThatFits)
    }
}
#endif
