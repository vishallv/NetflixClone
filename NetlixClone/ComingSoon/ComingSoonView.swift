//
//  ComingSoonView.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI

struct ComingSoonView: View {
    @State private var showNotification: Bool = false
    @State private var navHidden: Bool = true
    @State private var showMovieDetail: Movie? = nil
    @ObservedObject var vm = ComingSoonVM()
    @State var scrollOffset: CGFloat = 0.0
    @State var activeIndex: Int = 0
    
    func updateActiveIndex(scroll: CGFloat) {
        if scroll < 105 {
            activeIndex = 0
        }
        else {
            let removeOneOFive = scroll - 105
            let active = Int(removeOneOFive / 410) + 1
            activeIndex = Int(active)
        }
    }
    
    var body: some View {
        let movies = vm.movies.enumerated().map({$0})
        
        let scrollBinding = Binding {
            return scrollOffset
        } set: {
            scrollOffset = $0
            updateActiveIndex(scroll: $0)
        }

        
//        NavigationView {
        return    Group {
                ZStack {
                    Color.black
                    .ignoresSafeArea(.all)
                    
                    
                    TrackableScrollView(.vertical, showIndicators: false, contentOffset: scrollBinding) {
                        LazyVStack {
                            NotificationBar(showNotificationList: $showNotification)
                            
                            ForEach(movies,id: \.offset) { index,movie in
                                ComingSoonRow(movie: movie, showMovieDetail: $showMovieDetail)
                                    .frame(height: 400)
                                    .overlay (
                                        Group {
                                        index == activeIndex ? Color.clear : Color.black.opacity(0.9)
                                        }
                                        .animation(.easeInOut)
                                    )
                            }
                        }
                    }
                    .foregroundColor(.white)
                    NavigationLink(
                        destination: Text("Destination"),
                        isActive: $showNotification,
                        label: {
                            EmptyView()
                        })
                        .navigationTitle("")
                        .navigationBarHidden(navHidden)
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification), perform: { _ in
                            self.navHidden = true
                        })
                        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                            self.navHidden = false
                        })
                }
                
                
            }
//        }
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
        
    }
}
