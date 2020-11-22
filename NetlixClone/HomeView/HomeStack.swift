//
//  HomeStack.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/21/20.
//

import SwiftUI

struct HomeStack: View {
    let homeVM: HomeVM
    @Binding var movieDetailToShow: Movie?
    @Binding var genre: HomeGenre
    var topRowSelection: HomeTopRow
    var body: some View {
        ForEach(homeVM.allCategories, id: \.self) { category in
            VStack {
                HStack {
                    Text(category)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(homeVM.getMovieForCategory(category: category, homeRow: topRowSelection, genre: genre)) { movie in
                            StandardHomeMovie(movie: movie)
                                .frame(width: 100, height: 200)
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    movieDetailToShow = movie
                                }
                        }
                    }
                }
            }
        }
    }
}



struct HomeStackProvider: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            .ignoresSafeArea( edges: .all)
            ScrollView{
                HomeStack(homeVM: HomeVM(), movieDetailToShow: .constant(nil), genre: .constant(.AllGenres), topRowSelection: .home)
            }
            .foregroundColor(.white)
        }
        
    }
}
