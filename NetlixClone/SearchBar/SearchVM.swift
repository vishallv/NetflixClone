//
//  SearchVM.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/21/20.
//

import Foundation
import SwiftUI

class SearchVM: ObservableObject {
    
    @Published var isLoading = false
    @Published var viewState: ViewState = .ready
    
    @Published var popularMovies: [Movie] = []
    @Published var searchMovies: [Movie] = []
    
    @Published var isShowingPopular = true
    
    init() {
        getPopularMovie()
    }
    
    func updateSearchText(text: String) {
        
        setViewState(state: .loading)
        
        if text.count > 0 {
            isShowingPopular = false
            getSearchResult(text: text)
        }
        else {
            isShowingPopular = true
        }
    }
    
    private func setViewState(state: ViewState) {
        DispatchQueue.main.async {
            self.viewState = state
            self.isLoading = state == .loading
        }
    }
    
    private func getPopularMovie() {
        
        
        self.popularMovies = generateMovies(40)
    }
    
    private func getSearchResult(text: String) {
        let haveResult = Int.random(in: 0...3)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if haveResult == 0 {
                self.searchMovies = []
                self.viewState = .empty
            }
            else {
                self.searchMovies = generateMovies(21)
                self.setViewState(state: .ready)
            }
        }
    }
}


enum ViewState {
    case empty
    case loading
    case ready
    case error
}
