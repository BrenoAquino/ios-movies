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
            VStack {
                AsyncImageMovieDB(
                    image: movie.poster,
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(CGSize.portrait, contentMode: .fit)
                            .frame(width: geometry.size.width)
                    },
                    placeholder: {
                        ProgressView()
                            .frame(
                                width: geometry.size.width,
                                height: geometry.size.width * CGSize.portrait.proportionHW
                            )
                    }
                )
                Text(movie.name)
            }
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
