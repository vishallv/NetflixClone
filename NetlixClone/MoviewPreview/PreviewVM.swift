//
//  PreviewVM.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI

class PreviewVM: ObservableObject {
    var movie: Movie
    init(movie: Movie) {
        self.movie = movie
    }
}


