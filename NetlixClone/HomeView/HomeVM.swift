//
//  HomeVM.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/17/20.
//

import Foundation


class HomeVM: ObservableObject {
    
    @Published var movies: [String: [Movie]] = [:]
    
    var allCategories: [String] {
        movies.keys.map { String($0) }
    }
    init() {
        setupMovies()
    }
    
    func getMovieForCategory(category: String) -> [Movie] {
        return movies[category] ?? []
    }
    
    func setupMovies() {
        movies["Trending Now"] = trendingMovies
        movies["Stand Up Comedy"] = trendingMovies
        movies["New Releases"] = trendingMovies
        movies["Watch Again"] = trendingMovies
        movies["Sci-fi Movies"] = trendingMovies
    }
}
