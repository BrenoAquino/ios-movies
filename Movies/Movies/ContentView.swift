//
//  ContentView.swift
//  Movies
//
//  Created by Breno Aquino on 14/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CoordinatorFactory.home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
