//
//  MovieDetailView.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/20/20.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    let screen = UIScreen.main.bounds
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(edges: .all)
            
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 28))
                        
                    })
                }
                .padding(.horizontal,22)
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                    VStack {
                        StandardHomeMovie(movie: movie)
                            .frame(width: screen.width/2.5)
                        
                        MovieInfoSubHeadline(movie: movie)
                        if movie.promotionalHeadline != nil {
                            Text(movie.promotionalHeadline!)
                                .bold()
                                .font(.headline)
                        }
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: exampleMovie1)
    }
}

struct MovieInfoSubHeadline: View {
    var movie: Movie
    var body: some View {
        HStack(spacing:20){
            Image(systemName: "hand.thumbsup.fill")
                .foregroundColor(.white)
            Text(String(movie.year))
            RatingView(rating: movie.rating)
            Text(movie.numberOfSeasonToDisplay)
        }
        .foregroundColor(.gray)
        .padding(.vertical,6)
    }
}

struct RatingView: View {
    var rating: String
    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            
            Text("\(rating)")
                .foregroundColor(.white)
                .font(.system(size: 12))
                .bold()
        }
        .frame(width: 50, height: 20)
    }
}
