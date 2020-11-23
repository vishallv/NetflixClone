//
//  PreviewView.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/22/20.
//

import SwiftUI

struct PreviewView: View {
    @ObservedObject var vm: PreviewVM
    var playVideo: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            
            TrailerPlayerView(url: vm.movie.trailers.first?.videoURl,
                              playVideo: .constant(playVideo))
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing:0) {
                        
                        Text(vm.movie.name)
                            .foregroundColor(vm.movie.accentColor)
                            .bold()
                            .font(.title)
                    }
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.top,60)
                
                Spacer()
                
                HStack {
                    ForEach(0..<vm.movie.categories.count) { index in
                        let category = vm.movie.categories[index]
                        HStack {
                            Text(category)
                                .font(.footnote)
                            
                            if category != vm.movie.categories[vm.movie.categories.count - 1] {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 3))
                            }
                                
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    SmallVerticalButton(text: "My List",
                                        isOnImage: "checkmark",
                                        isOffImage: "plus",
                                        isOn: true,
                                        color: vm.movie.accentColor) {
                        //Action
                    }
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        HStack {
                            
                            Image(systemName: "arrowtriangle.right.fill")
                            Text("Play")
                                .fontWeight(.heavy)
                        }
                        .padding(.vertical,12)
                        .padding(.horizontal,26)
                        .border(vm.movie.accentColor, width: 3)
                    })
                    Spacer()
                    SmallVerticalButton(text: "Info",
                                        isOnImage: "info.circle",
                                        isOffImage: "info.circle",
                                        isOn: true,
                                        color: vm.movie.accentColor) {
                        
                        //Action
                    }
                    
                    Spacer()
                }
                .padding(.top, 14)
                
            }
            .padding(.bottom, 48)
            .foregroundColor(vm.movie.accentColor)
        }
        .ignoresSafeArea(.all)
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(vm: PreviewVM(movie: exampleMovie1), playVideo: true)
    }
}
