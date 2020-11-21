//
//  Trailer.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/21/20.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    let id = UUID().uuidString
    var name: String
    var videoURl: URL
    var thumbnailURL: URL
}
