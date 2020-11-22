//
//  GlobalHelper.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/17/20.
//

import Foundation
import SwiftUI

let exampleVideoURL = URL(string: "https://www.radiantmediaplayer.com/media/big-buck-bunny-360p.mp4")!
let exampleImageURL = URL(string: "https://picsum.photos/300/104")!
let exampleImageURL2 = URL(string: "https://picsum.photos/300/105")!
let exampleImageURL3 = URL(string: "https://picsum.photos/300/106")!
var randomExampleImageURL: URL {
    return [exampleImageURL, exampleImageURL2, exampleImageURL3].randomElement() ?? exampleImageURL
}

let exampleTrailer1 = Trailer(name: "Season 3 Trailer", videoURl: exampleVideoURL, thumbnailURL: randomExampleImageURL)

let exampleTrailer2 = Trailer(name: "The Hero's Journey", videoURl: exampleVideoURL, thumbnailURL: randomExampleImageURL)

let exampleTrailer3 = Trailer(name: "The Mysterious", videoURl: exampleVideoURL, thumbnailURL: randomExampleImageURL)

let exampleTrailers = [exampleTrailer1, exampleTrailer2, exampleTrailer3]

let episode1 = Episode(name: "Beginnings and Endings",
                         season: 1,
                         episodeNumber: 1,
                         thumbnailImageURLString: "https://picsum.photos/300/112",
                         description: "Six months after the disappearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.",
                         length: 53,
                         videoURL: exampleVideoURL)
let episode2 = Episode(name: "Dark Matter",
                         season: 1,
                         episodeNumber: 2,
                         thumbnailImageURLString: "https://picsum.photos/300/111",
                         description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.",
                         length: 54,
                         videoURL: exampleVideoURL)
let episode3 = Episode(name: "Ghosts",
                         season: 1,
                         episodeNumber: 3,
                         thumbnailImageURLString: "https://picsum.photos/300/110",
                         description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
                         length: 56,
                         videoURL: exampleVideoURL)

let episode4 = Episode(name: "Beginnings and Endings",
                         season: 2,
                         episodeNumber: 1,
                         thumbnailImageURLString: "https://picsum.photos/300/109",
                         description: "Six months after the disappearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.",
                         length: 53,
                         videoURL: exampleVideoURL)
let episode5 = Episode(name: "Dark Matter",
                         season: 2,
                         episodeNumber: 2,
                         thumbnailImageURLString: "https://picsum.photos/300/108",
                         description: "Clausen and Charlotte interview Regina. The Stranger takes Hannah to 1987, where Claudia has an unnerving encounter and Egon visits an old nemesis.",
                         length: 54,
                         videoURL: exampleVideoURL)
let episode6 = Episode(name: "Ghosts",
                         season: 2,
                         episodeNumber: 3,
                         thumbnailImageURLString: "https://picsum.photos/300/107",
                         description: "In 1954, a missing Helge returns, but he'll only speak to Noah. In 1987, Claudia brings the time machine to Tannhaus, and Egon questions Ulrich again.",
                         length: 56,
                         videoURL: exampleVideoURL)

var allExampleEpisodes = [episode1, episode2, episode3, episode4, episode5, episode6]

let exampleMovie1 = Movie(id: UUID().uuidString,
                          name: "DARK",
                          thumbnailURL: URL(string: "https://picsum.photos/200/300")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeason: 2,
                          episodes: allExampleEpisodes,
                          promotionalHeadline: "New Season Coming",
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
                          moreLikeThis: [exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5, exampleMovie6],
                          trailers: exampleTrailers
                          )

let exampleMovie2 = Movie(id: UUID().uuidString,
                          name: "TRAVELERS",
                          thumbnailURL: URL(string: "https://picsum.photos/200/301")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeason: 2,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
                          moreLikeThis: [], trailers: exampleTrailers)

let exampleMovie3 = Movie(id: UUID().uuidString,
                          name: "COMMUNITY",
                          thumbnailURL: URL(string: "https://picsum.photos/200/302")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeason: 3,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
                          moreLikeThis: [], trailers: exampleTrailers)

let exampleMovie4 = Movie(id: UUID().uuidString,
                          name: "ALONE",
                          thumbnailURL: URL(string: "https://picsum.photos/200/303")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeason: 4, defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
                          moreLikeThis: [], trailers: exampleTrailers)

let exampleMovie5 = Movie(id: UUID().uuidString,
                          name: "HANNIBAL",
                          thumbnailURL: URL(string: "https://picsum.photos/200/304")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeason: 5,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
                          moreLikeThis: [], trailers: exampleTrailers)

let exampleMovie6 = Movie(id: UUID().uuidString,
                          name: "After Life",
                          thumbnailURL: URL(string: "https://picsum.photos/200/305")!,
                          categories: ["Dystopian","Exciting","Suspenseful","Sci-Fi TV"],
                          year: 2020,
                          rating: "TV-MA",
                          numberOfSeason: 6,
                          defaultEpisodeInfo: exampleEpisodeInfo1,
                          creators: "Baran bo Odan, Jantje Friese",
                          cast: "Louis Hofmann, Oliver Masucci, jordis Triebel",
                          moreLikeThis: [], trailers: exampleTrailers)


let exampleEpisodeInfo1 = CurrentEpisodeInfo(episodeName: "Beginnings and Endings", description: "Six months after the disappearances, the police form a task force. In 2052, Jonas learns that most of Winden perished in an apocalyptic event.", season: 2, episode: 1)

var trendingMovies: [Movie] {
    return [exampleMovie1,exampleMovie2,exampleMovie3,exampleMovie4,exampleMovie5, exampleMovie6].shuffled()
}


extension LinearGradient {
    static let blackOpacityGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black.opacity(0),Color.black.opacity(0.95)]),
        startPoint: .top,
        endPoint: .bottom
    )
}

extension String {
    func widthOfString(withFont font: UIFont) -> CGFloat {
        let fontAtt = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAtt)
        return size.width
    }
}
