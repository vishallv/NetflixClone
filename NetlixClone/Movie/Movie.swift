//
//  Movie.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/17/20.
//

import Foundation

struct Movie : Identifiable{
    var id: String
    var name: String
    var thumbnailURL: URL
    
    let categories: [String]
}
