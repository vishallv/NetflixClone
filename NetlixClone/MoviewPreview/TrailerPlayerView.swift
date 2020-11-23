//
//  TrailerPlayerView.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI
import VideoPlayer

struct TrailerPlayerView: View {
    var url: URL?
    
    @Binding var playVideo: Bool
    var body: some View {
        
        if url != nil {
            VideoPlayer(url: url!, play: $playVideo)
        }
    }
}

struct TrailerPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        TrailerPlayerView(url: exampleVideoURL, playVideo: .constant(true))
    }
}
