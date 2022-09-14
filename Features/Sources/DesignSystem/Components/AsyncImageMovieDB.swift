//
//  AsyncImageMovieDB.swift
//  
//
//  Created by Breno Aquino on 14/09/22.
//

import Foundation
import SwiftUI

public struct AsyncImageMovieDB<Content, Placeholder>: View where Content: View, Placeholder: View  {
    
    let url: URL?
    let content: (Image) -> Content
    @ViewBuilder let placeholder: () -> Placeholder
    
    public init(
        image: String,
        @ViewBuilder content: @escaping (Image) -> Content,
        @ViewBuilder placeholder: @escaping () -> Placeholder
    ) {
        self.url = URL(string: "https://image.tmdb.org/t/p/original" + image)
        self.content = content
        self.placeholder = placeholder
    }
    
    public var body: some View {
        AsyncImage(url: url, content: content, placeholder: placeholder)
    }
}
