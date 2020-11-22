//
//  HomeView.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/17/20.
//

import SwiftUI

struct HomeView: View {
    
    var homeVM = HomeVM()
    @State private var movieDetailToShow: Movie? = nil
    @State private var topRowSelection: HomeTopRow = .home
    @State private var homeGenre: HomeGenre = .AllGenres
    @State private var showGenreSelection: Bool = false
    @State private var showTopRowSelection: Bool = false
    
    let screen = UIScreen.main.bounds
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView (showsIndicators: false){
                LazyVStack {
                    
                    TopRowButtons(topRowSelection: $topRowSelection,
                                  homeGenre: $homeGenre,
                                  showGenreSelection: $showGenreSelection,
                                  showTopRowSelection: $showTopRowSelection)
                    
                    TopMoviePreview(movie: exampleMovie1)
                        .frame(width: screen.width)
                        .padding(.top,-100)
                        .zIndex(-1)
                    
                    HomeStack(homeVM: homeVM, movieDetailToShow: $movieDetailToShow, genre: $homeGenre, topRowSelection: topRowSelection)
                }
            }
            
            if movieDetailToShow != nil {
                MovieDetailView(movie: movieDetailToShow!, movieDetailToShow: $movieDetailToShow)
                    .animation(.easeIn)
                    .transition(.opacity)
            }
            
            if showTopRowSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        ForEach(HomeTopRow.allCases, id: \.self) { topRow in
                            
                            Button(action: {
                                topRowSelection = topRow
                                showTopRowSelection = false
                                
                            }, label: {
                                if topRow == topRowSelection {
                                Text(topRow.rawValue)
                                    .bold()
                                }
                                else {
                                    Text(topRow.rawValue)
                                        .bold()
                                        .foregroundColor(.gray)
                                }
                            })
                        }
                        
                        Spacer()
                        Button(action: {
                            showTopRowSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                                .scaleEffect(x:1.1)
                                .foregroundColor(.white)
                        })
                        .padding(.bottom,30)
                    }
                    
                    
                }
                .ignoresSafeArea( edges: .all)
                .font(.title)
            }
            
            if showGenreSelection {
                Group {
                    Color.black.opacity(0.9)
                    
                    VStack(spacing: 40) {
                        Spacer()
                        ScrollView {
                            ForEach(homeVM.allGenres, id: \.self) { genre in
                                
                                Button(action: {
                                    homeGenre = genre
                                    showGenreSelection = false
                                    
                                }, label: {
                                    if genre == homeGenre {
                                    Text(genre.rawValue)
                                        .bold()
                                    }
                                    else {
                                        Text(genre.rawValue)
                                            .bold()
                                            .foregroundColor(.gray)
                                    }
                                }).padding(.bottom,40)
                            }
                        }
                        
                        Spacer()
                        Button(action: {
                            showGenreSelection = false
                        }, label: {
                            Image(systemName: "x.circle.fill")
                                .font(.system(size: 40))
                                .scaleEffect(x:1.1)
                                .foregroundColor(.white)
                        })
                        .padding(.bottom,30)
                    }
                    
                    
                }
                .ignoresSafeArea( edges: .all)
                .font(.title)
            }
        }
        .foregroundColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopRowButtons: View {
    @Binding var topRowSelection: HomeTopRow
    @Binding var homeGenre: HomeGenre
    @Binding  var showGenreSelection: Bool
    @Binding  var showTopRowSelection: Bool
    
    var body: some View {
        switch topRowSelection {
        case .home:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action: {
                    topRowSelection = .tvShows
                }, label: {
                    Text("TV Shows")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action: {
                    topRowSelection = .movies
                }, label: {
                    Text("Movies")
                })
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                Button(action: {
                    topRowSelection = .myList
                }, label: {
                    Text("My List")
                })
                .buttonStyle(PlainButtonStyle())
                
            }
            .padding(.leading,10)
            .padding(.trailing,35)
            
        case .tvShows,.movies,.myList:
            HStack {
                Button(action: {
                    topRowSelection = .home
                }, label: {
                    Image("netflix_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                })
                .buttonStyle(PlainButtonStyle())
                
                HStack {
                    Button(action: {
                        showTopRowSelection = true
                    }, label: {
                        HStack {
                            Text(topRowSelection.rawValue)
                                .font(.system(size: 18))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        showGenreSelection = true
                    }, label: {
                        HStack {
                            Text(homeGenre.rawValue)
                                .font(.system(size: 12))
                            Image(systemName: "triangle.fill")
                                .font(.system(size: 10))
                                .rotationEffect(.degrees(180), anchor: .center)
                        }
                    })
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                
            }
            .padding(.leading,10)
            .padding(.trailing,35)
        }
        
        
    }
}

enum HomeTopRow: String, CaseIterable {
    case home = "Home"
    case tvShows = "TV Shows"
    case movies = "Movies"
    case myList = "My List"
}


enum HomeGenre: String {
    case AllGenres = "All"
    case Action
    case Comedy
    case Horror
    case Thriller
}

