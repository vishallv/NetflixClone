//
//  TrailerList.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/21/20.
//

import SwiftUI

struct TrailerList: View {
    var trailers: [Trailer]
    let screen = UIScreen.main.bounds
    var body: some View {
        VStack {
            ForEach(trailers) { trailer in
                VStack(alignment: .leading) {
                    VideoPreviewImage(imageURL: trailer.thumbnailURL, videoURL: trailer.videoURl)
                        .frame(maxWidth: screen.width)
                        Text(trailer.name)
                            .font(.headline)

                }
                .foregroundColor(.white)
            }
        }
        
    }
}

struct TrailerList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(edges: .all)
            TrailerList(trailers: exampleTrailers)
        }
    }
}


