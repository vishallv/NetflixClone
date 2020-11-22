//
//  ContentView.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/17/20.
//

import SwiftUI

struct ContentView: View {
    init() {
    UITabBar.appearance().isTranslucent = false
    UITabBar.appearance().barTintColor = .black
    }
    var body: some View {
        
       
        TabView{
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(0)
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("1")
                }.tag(1)
            
            Text("Coming Soon")
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("1")
                }.tag(2)
            
            Text("Downloads")
                .tabItem {
                    Image(systemName: "arrow.down.to.line.alt")
                    Text("1")
                }.tag(3)
            
            Text("More")
                .tabItem {
                    Image(systemName: "equal")
                    Text("1")
                }.tag(4)
        }.accentColor(.white)

            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
