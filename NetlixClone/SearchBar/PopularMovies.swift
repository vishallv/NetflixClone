//
//  PopularMovies.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI
import KingfisherSwiftUI

struct PopularMovies: View {
    var movie: Movie
    @Binding var movieDetailToShow: Movie?

    var body: some View {
        
        GeometryReader { proxy in
            HStack{
                KFImage(movie.thumbnailURL)
                    .resizable()
                    .frame(width: proxy.size.width / 3)
                    .padding(.leading,3)
                
               
                
                Text(movie.name)
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrowtriangle.right.fill")
                })
                .padding(.trailing,20)
            }
            .foregroundColor(.white)
            .onTapGesture {
                self.movieDetailToShow = movie
            }
        }
    }
}

struct PopularMovies_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(edges: .all)
            PopularMovies(movie: exampleMovie1, movieDetailToShow: .constant(nil))
                .frame(height: 75)
        }
    }
}
