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
    var allGenres: [HomeGenre] = [.Action,.AllGenres,.Comedy,.Horror,.Thriller]
    init() {
        setupMovies()
    }
    
    func getMovieForCategory(category: String, homeRow: HomeTopRow, genre: HomeGenre) -> [Movie] {
        switch homeRow {
        case .home: return movies[category] ?? []
        case .movies: return (movies[category] ?? []).filter({($0.movieType == .Movie) && ($0.genre == genre)})
        case .tvShows: return (movies[category] ?? []).filter({($0.movieType == .tvShow) && ($0.genre == genre)})
        case .myList: return movies[category] ?? []
        }
    }
    
    func setupMovies() {
        movies["Trending Now"] = trendingMovies
        movies["Stand Up Comedy"] = trendingMovies
        movies["New Releases"] = trendingMovies
        movies["Watch Again"] = trendingMovies
        movies["Sci-fi Movies"] = trendingMovies
    }
}
