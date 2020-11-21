//
//  GlobalHelper.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/17/20.
//

import Foundation
import SwiftUI

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "DARK",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],year: 2020, rating: "TV-MA", numberOfSeason: 1,
                          promotionalHeadline: "New Season Coming")

let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "TRAVELERS",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],year: 2020, rating: "TV-MA", numberOfSeason: 2)

let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "COMMUNITY",
                          thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],year: 2020, rating: "TV-MA", numberOfSeason: 3)

let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "ALONE",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],year: 2020, rating: "TV-MA", numberOfSeason: 4)

let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "HANNIBAL",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],year: 2020, rating: "TV-MA", numberOfSeason: 5)

let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "After Life",
                          thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],year: 2020, rating: "TV-MA", numberOfSeason: 6)

let trendingMovies: [Movie] = [exampleMovie1,exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5, exampleMovie6]


extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0),Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}
