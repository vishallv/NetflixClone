//
//  TopMoviePreview.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/19/20.
//

import SwiftUI
import KingfisherSwiftUI

struct TopMoviePreview: View {
    var movie: Movie
    
    func isCategoryLast(_ cat: String) -> Bool {
        let count = movie.categories.count
        
        if cat == movie.categories[count - 1] {
            return true
        }
        return false
    }
    var body: some View {
        ZStack{
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipped()
                
            
            VStack {
                Spacer()
                HStack{
                    ForEach(movie.categories,id: \.self) { (category) in
                        HStack {
                            Text(category)
                                .font(.system(size: 13))
                            if !isCategoryLast(category) {
                                Image(systemName: "circle.fill")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 3))
                            }
                        }
                    }
                }
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: false) {
                        
                    }
                    Spacer()
                    PlayButton(text: "Play", imageName: "play.fill") {
                        
                    }
                    .frame(width: 120)
                    Spacer()
                    SmallVerticalButton(text: "Info", isOnImage: "info.circle", isOffImage: "info.circle", isOn: false) {
                        
                    }
                    Spacer()
                }
                .padding(.top, 15)
            }
            .background(
                LinearGradient.blackOpacityGradient
                .padding(.top,250)
            )
        }
        .foregroundColor(.white)
    }
}

struct TopMoviePreview_Previews: PreviewProvider {
    static var previews: some View {
        TopMoviePreview(movie: exampleMovie1)
        
    }
}
