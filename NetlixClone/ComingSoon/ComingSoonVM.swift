//
//  ComingSoonVM.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import Foundation
import SwiftUI

class ComingSoonVM: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        self.movies = generateMovies(20)
    }
}
