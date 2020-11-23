//
//  PagerView.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI

struct PagerView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    @State var verticalDragIsActive: Bool = false
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    let content: Content
    
    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,
        externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.externalDragGesture = externalDragGesture
        self.content = content()
    }
    var body: some View {
        GeometryReader { geo in
            
            HStack(spacing: 0) {
                self.content.frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -CGFloat(self.currentIndex) * geo.size.width)
            .offset(x: self.translation)
            .animation(.interactiveSpring())
            .gesture(
                externalDragGesture.simultaneously(
                    with:
                        DragGesture(minimumDistance: 20)
                        .onChanged({ (val) in
                            
                            if verticalDragIsActive {
                                return
                            }
                            
                            if abs(val.translation.width) < abs(val.translation.height) {
//                                if val.translation.width < 30 {
                                    verticalDragIsActive = true
                                    return
//                                }
                            }
                            
                            translation = val.translation.width
                        }).onEnded({ (val) in
                            if verticalDragIsActive {
                                verticalDragIsActive = false
                                return
                            }
                            
                            let offset = val.translation.width / geo.size.width
                            
                            let newIndex = (CGFloat(self.currentIndex) - offset).rounded()
                            self.currentIndex = min(max(0,Int(newIndex)),pageCount-1)
                            translation = 0
                            
                        })
                )
            )
            
        }
    }
}

//struct PagerDummy: View {
//    @State var currentIndex: Int = 0
//    @State var translation: CGFloat = .zero
//    var body: some View {
//        
//        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
//            Color.red
//            Color.blue
//            Color.pink
//        }
//        
//    }
//}
//
//struct PagerView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        PagerDummy()
////        PagerView(pageCount: 3, currentIndex: .constant(0), translation: .constant(0), content: {
////            Color.red
////            Color.blue
////            Color.pink
////        })
//    }
//}
