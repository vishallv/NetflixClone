//
//  Episode.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/21/20.
//

import Foundation

struct Episode: Identifiable {
    let id = UUID().uuidString
    
    let name: String
    let season: Int
    let episodeNumber: Int
    let thumbnailImageURLString: String
    let description: String
    let length: Int
    var videoURL: URL
    
    
    var thumbnailURL: URL {
        return URL(string: thumbnailImageURLString)!
    }
}
