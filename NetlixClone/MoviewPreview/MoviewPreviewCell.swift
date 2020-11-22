//
//  MoviewPreviewCell.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI
import KingfisherSwiftUI

struct MoviewPreviewCell: View {
    var movie: Movie
    
    var colors: [Color] = [.red,.orange, .pink,.yellow]
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(movie.thumbnailURL)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 3)
                        .foregroundColor(colors.randomElement())
            )
            
            Image(movie.previewImageName)
                .resizable()
                .scaledToFit()
                .offset(y: -20)
                .frame(height: 65)
        }
        
    }
}

struct MoviewPreviewCell_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            MoviewPreviewCell(movie: exampleMovie1)
                .frame(width: 160, height: 50)
        }
    }
}
