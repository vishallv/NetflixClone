//
//  PreviewList.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI

struct PreviewList: View {
    @State private var currentTranslation: CGFloat = 0
    var movies: [Movie]
    @Binding var currentIndex: Int
    @Binding var isVisible: Bool
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    var screen = UIScreen.main.bounds
    
    func shouldPlayVideo(index: Int) -> Bool {
        if !isVisible {
            return false
        }
        if index != currentIndex {
            return false
        }
        return true
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            PagerView(pageCount: movies.count,
                      currentIndex: $currentIndex,
                      translation: $currentTranslation, externalDragGesture: externalDragGesture) {
                ForEach(0..<movies.count) {index in
                    
                    PreviewView(vm: PreviewVM(movie: movies[index]),
                                playVideo: shouldPlayVideo(index: index))
                        .frame(width: screen.width)
                }
            }
            .frame(width: screen.width)
        }
    }
}

//struct ExampleList: View {
//    @State var currentIndex: Int = 0
//    @State var isVisible: Bool = true
//    var body: some View {
//        PreviewList(movies: trendingMovies, currentIndex: $currentIndex, isVisible: $isVisible, externalDragGesture: externalDragGesture)
//    }
//}
//
//
//struct PreviewList_Previews: PreviewProvider {
//    static var previews: some View {
//        ExampleList()
////        PreviewList(movies: trendingMovies,currentIndex: .constant(0),isVisible: .constant(true))
//    }
//}
