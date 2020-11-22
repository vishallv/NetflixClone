//
//  ComingSoonRow.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI
import KingfisherSwiftUI
import AVKit

struct ComingSoonRow: View {
    var movie: Movie
    @Binding var showMovieDetail: Movie?
    var screen = UIScreen.main.bounds
    var player: AVPlayer {
        return AVPlayer(url: exampleVideoURL)
    }
    var body: some View {
        VStack {
//            Color.blue
            VideoPlayer(player: player)
                .frame(height: 200)
            
            VStack {
                HStack {
                    KFImage(movie.thumbnailURL)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: screen.size.width/3, height: 75)
                        .clipped()
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "bell")
                                .font(.title3)
                            Text("Remind Me")
                        }
                    })
                    .padding(.horizontal)
                    
                    Button(action: {
                        showMovieDetail = movie
                    }, label: {
                        VStack(spacing: 6) {
                            Image(systemName: "info.circle")
                                .font(.title3)
                            Text("Info")
                        }
                    })
                    .padding(.trailing,24)
                }
                .font(.caption)
                
                VStack(alignment:.leading) {
                    Text(movie.name)
                        .font(.title2)
                        .bold()
                    Text(movie.episodeDescriptionDisplay)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            
            
        }
        
    }
}

struct ComingSoonRow_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            ComingSoonRow(movie: exampleMovie1, showMovieDetail: .constant(nil))
        }
    }
}
