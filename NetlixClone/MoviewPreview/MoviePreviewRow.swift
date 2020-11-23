//
//  MoviePreviewRow.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI

struct MoviePreviewRow: View {
    var movies: [Movie]
    @Binding  var currentIndex: Int
    @Binding  var isVisible: Bool
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Previews")
                .font(.title3)
                .bold()
                .padding(.leading,6)
            
            ScrollView(.horizontal, showsIndicators: false) {
               
                LazyHStack {
                    
                    ForEach(0..<movies.count) { index in
                        
                        MoviewPreviewCell(movie: movies[index])
                            .frame(width: 120,height: 120)
                            .padding(.trailing,14)
                            .padding(.leading, 6)
                            .onTapGesture {
                                currentIndex = index
                                isVisible = true
                            }
                    }
                }
            }
        }
        .foregroundColor(.white)
        .frame(height: 185)
    }
}

struct MoviePreviewRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            MoviePreviewRow(movies: trendingMovies, currentIndex: .constant(0),isVisible: .constant(false))
                
        }
    }
}
