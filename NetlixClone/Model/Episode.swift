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
    let thumbnailURLImageString: String
    let description: String
    let length: Int
    
    var thumbnailURL: URL {
        return URL(string: thumbnailURLImageString)!
    }
}
