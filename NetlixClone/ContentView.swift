//
//  ContentView.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/17/20.
//

import SwiftUI

struct ContentView: View {
    @State private var showPreviewFullScreen = false
    @State private var previewStartingIndex: Int = 0
    
    @State private var previewCurrentPos: CGFloat = 1000
    @State private var previewNewPos: CGFloat = 1000
    
    @State private var previewHorizontalDragActive: Bool = false
    
    let screen = UIScreen.main.bounds
//    @State private var currentIndex: Int = 0
//    @State private var isVisible: Bool = false
//    @State private var currentPOS: CGFloat = 1000
//    @State private var newPOS: CGFloat = 1000
//    @State private var previewHorizontalActive: Bool = false
//    let screen = UIScreen.main.bounds
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = .black
    }
    
    var body: some View {
        let previewDragGesture = DragGesture(minimumDistance: 20)
            .onChanged { value in
                
                if previewHorizontalDragActive {
                    return
                }
                
                if previewCurrentPos == .zero {
                    if abs(value.translation.width) > abs(value.translation.height) {
                        previewHorizontalDragActive = true
                        return
                    }
                }
                
                // VERTICAL ONLY
                let shouldBePosition = value.translation.height + self.previewNewPos
                
                if shouldBePosition < 0 {
                    return
                } else {
                    self.previewCurrentPos = shouldBePosition
                }
                
            }
            .onEnded { value in
                if previewHorizontalDragActive {
                    previewHorizontalDragActive = false
                    return
                }
                
                let shouldBePosition = value.translation.height + self.previewNewPos
                
                if shouldBePosition < 0 {
                    self.previewCurrentPos = .zero
                    self.previewNewPos = .zero
                } else {
                    let closingPoint = screen.size.height * 0.2
                    if shouldBePosition > closingPoint {
                        withAnimation {
                            self.showPreviewFullScreen = false
                            self.previewCurrentPos = screen.height + 20
                            self.previewNewPos = screen.height + 20
                        }
                    } else {
                        withAnimation {
                            self.previewNewPos = .zero
                            self.previewCurrentPos = .zero
                        }
                    }
                }
                
                previewHorizontalDragActive = false
            }

        
        return ZStack {
            TabView{
                HomeView(currentIndex: $previewStartingIndex, isVisible: $showPreviewFullScreen)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }.tag(0)
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }.tag(1)
                
                ComingSoonView()
                    .tabItem {
                        Image(systemName: "play.rectangle")
                        Text("Coming Soon")
                    }.tag(2)
                
                DownloadView()
                    .tabItem {
                        Image(systemName: "arrow.down.to.line.alt")
                        Text("Downloads")
                    }.tag(3)
                
                Text("More")
                    .tabItem {
                        Image(systemName: "equal")
                        Text("1")
                    }.tag(4)
            }.accentColor(.white)
            
            
            PreviewList(movies: trendingMovies,
                        currentIndex: $previewStartingIndex,
                        isVisible: $showPreviewFullScreen, externalDragGesture: previewDragGesture)
                .offset(y:previewCurrentPos)
                .isHidden(!showPreviewFullScreen)
                .animation(.easeIn)
                .transition(.move(edge: .bottom))
        }
        .onChange(of: showPreviewFullScreen, perform: { value in
            if value {
                // show fullscreen
                withAnimation {
                    previewCurrentPos = .zero
                    previewNewPos = .zero
                }
            } else {
                // hiding
                withAnimation {
                    self.previewCurrentPos = screen.height + 20
                    self.previewNewPos = screen.height + 20
                }
            }
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
