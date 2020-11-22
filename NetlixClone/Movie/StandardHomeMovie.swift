//
//  StandardHomeMovie.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/17/20.
//

import SwiftUI
import KingfisherSwiftUI
struct StandardHomeMovie: View {
    let movie: Movie
    var body: some View {
        KFImage(movie.thumbnailURL)
            .resizable()
            .scaledToFill()
            
    }
}

struct StandardHomeMovie_Previews: PreviewProvider {
    static var previews: some View {
        StandardHomeMovie(movie: exampleMovie1)
            .frame(width: 200, height: 300)
    }
}
