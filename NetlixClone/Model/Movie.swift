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
    
    
    
    var episodes: [Episode]?
    
    var promotionalHeadline: String?
    var currentEpisode: CurrentEpisodeInfo?
    var defaultEpisodeInfo: CurrentEpisodeInfo
    
    var creators: String
    var cast: String
    var moreLikeThis: [Movie]
    var trailers: [Trailer]
    
    var numberOfSeasonToDisplay: String {
        if let season = numberOfSeason {
            switch season {
            case 1: return "1 Season"
            default: return "\(season) Seasons"
            }
        }
        return ""
    }
    
    var episodeInfoDisplay: String {
        if let current = currentEpisode {
            return "S\(current.season):E\(current.episode) \(current.episodeName)"
        }
        else{
            return "S\(defaultEpisodeInfo.season):E\(defaultEpisodeInfo.episode) \(defaultEpisodeInfo.episodeName)"
        }
    }
    
    var episodeDescriptionDisplay: String {
        if let current = currentEpisode {
            return current.description
        }
        else {
            return defaultEpisodeInfo.description
        }
    }
    
}

struct CurrentEpisodeInfo: Hashable, Equatable {
    let episodeName: String
    let description: String
    let season: Int
    let episode: Int
}
