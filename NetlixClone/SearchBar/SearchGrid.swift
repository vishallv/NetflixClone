//
//  SearchGrid.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI

struct SearchGrid: View {
    
    var movies: [Movie]
    @Binding var movieDetailToShow: Movie?
    let coloumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
        
    ]
    var body: some View {
        LazyVGrid(columns: coloumns,spacing: 10) {
            ForEach(movies,id:\.id) { movie in
                StandardHomeMovie(movie: movie)
                    .frame(height:160)
                    .onTapGesture {
                        movieDetailToShow = movie
                    }
            }
        }
    }
}

struct SearchGrid_Previews: PreviewProvider {
    static var previews: some View {
        SearchGrid(movies: trendingMovies, movieDetailToShow: .constant(nil))
    }
}
