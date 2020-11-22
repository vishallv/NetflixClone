//
//  CustomTabSwitcher.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/21/20.
//

import SwiftUI

struct CustomTabSwitcher: View {
    @State private var currentTab: CustomTab = .episodes
    
    let movie: Movie
    var tabs: [CustomTab]
    @Binding var showSeasonPicker: Bool
    @Binding var selectedSeason: Int
    func widthForTab(_ tab: CustomTab) -> CGFloat {
        return tab.rawValue.widthOfString(withFont: .systemFont(ofSize: 20, weight: .bold))
    }
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing:20) {
                    ForEach(tabs, id:\.self) { tab in
                        
                        VStack{
                            Rectangle()
                                .frame(width: widthForTab(tab),height: 6)
                                .foregroundColor(tab == currentTab ? .red : .clear)
                            
                            Button(action: {
                            currentTab = tab
                                
                            }, label: {
                                Text(tab.rawValue)
                                    .foregroundColor(tab == currentTab ? .white : .gray)
                                    .font(.system(size: 20))
                                    .bold()
                                    
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: widthForTab(tab),height: 30)
                            
                            
                        }
                    }
                }
                
            }
            switch currentTab {
            case .episodes :
                EpisodeView(episodes: movie.episodes ?? [], showSeasonPicker: $showSeasonPicker, selectedSeason: $selectedSeason)
            case .trailers:
                TrailerList(trailers: movie.trailers)
            case .more:
                MoreLikeThis(movies: movie.moreLikeThis)
            }
        }
        .foregroundColor(.white)
        
        
    }
}

enum CustomTab: String {
    case episodes = "Episodes"
    case trailers = "Trailers & more"
    case more = "More Like This"
}

struct CustomTabSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .ignoresSafeArea( edges: .all)
            CustomTabSwitcher(movie:exampleMovie1, tabs: [.episodes,.trailers,.more],
                              showSeasonPicker: .constant(false),selectedSeason: .constant(1))
        }
        
    }
}


