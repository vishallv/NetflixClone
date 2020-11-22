//
//  SearchView.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/21/20.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var vm = SearchVM()
    @State private var searchText = ""
    @State private var movieDetailToShow: Movie? = nil
    var body: some View {
        let searchBinding = Binding {
            return searchText
        } set: {
            searchText = $0
            vm.updateSearchText(text: $0)
        }
        
        return ZStack {
            Color.black
                .ignoresSafeArea(.all)
            VStack{
                SearchBar(text: searchBinding, isLoading: $vm.isLoading)
                    .padding()
                
                ScrollView{
                    if vm.isShowingPopular {
                        PopularList(popularMovies: vm.popularMovies, movieDetailToShow: $movieDetailToShow)
                    }
                    
                    if vm.viewState == .empty {
                        Text("Your Result was empty")
                            .bold()
                            .padding(.top,150)
                    } else if vm.viewState == .ready && !vm.isShowingPopular{
                        VStack {
                            HStack{
                                Text("Movies & TV")
                                    .bold()
                                    .font(.title3)
                                    .padding(.leading,12)
                                
                                Spacer()
                            }
                            SearchGrid(movies: generateMovies(20), movieDetailToShow: $movieDetailToShow)
                        }
                    }
                }
                
                Spacer()
                
            }
            
            if movieDetailToShow != nil {
                MovieDetailView(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
            }
        }
        .foregroundColor(.white)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct PopularList: View {
    var popularMovies: [Movie]
    @Binding var movieDetailToShow: Movie?
    
    var body: some View {
        VStack {
            HStack{
                Text("Popular Movies")
                    .font(.title3)
                    .bold()
                    .padding(.leading,10)
                Spacer()
            }
            LazyVStack {
                ForEach(popularMovies) { movie in
                    PopularMovies(movie: movie, movieDetailToShow: $movieDetailToShow)
                        .frame(height: 74)
                }
            }
        }
    }
}
