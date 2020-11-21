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
    
    var year: Int
    var rating: String
    var numberOfSeason: Int?
    
    var episode: [Episode]?
    
    var promotionalHeadline: String?
    
    var numberOfSeasonToDisplay: String {
        if let season = numberOfSeason {
            switch season {
            case 1: return "1 Season"
            default: return "\(season) Seasons"
            }
        }
        return ""
    }
    
}
