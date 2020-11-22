//
//  Search.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/21/20.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
//        = ""
    @State var isEditing: Bool = true
    @Binding var isLoading: Bool
//        = false
    var body: some View {
        ZStack(alignment: .leading) {
            Color.grayBack
                .frame(width: 270,height:36)
                .cornerRadius(8)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.grayText)
                    .padding(.leading,10)
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.leading,-7)
                    .padding(.horizontal,10)
                    .background(Color.grayBack)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .onTapGesture {
                        isEditing = true
                    }
                    .animation(.default)
                
                if !text.isEmpty {
                    if isLoading {
                        
                        Button(action: {
                            text = ""
                        }, label: {
                            ActivityIndicator(style: .medium, animate: .constant(true))
                                .configure{
                                    $0.color = .white
                                }
                                .frame(width: 35, height: 35)
                                .padding(.trailing,32)
                        })
                        
                    }
                    else {
                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.grayText)
                                .frame(width: 35, height: 35)
                                .padding(.trailing,18)
                        })
                    }
                }
                
                
                if isEditing {
                    Button(action: {
                        text = ""
                        isEditing = false
                        hideKeyBoard()
                        
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.white)
                    })
                    .padding(.trailing,10)
                    .animation(.default)
                    .transition(.move(edge: .trailing))
                }
                
            }
        }
    }
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .ignoresSafeArea(.all)
            SearchBar(text: .constant(""), isLoading: .constant(false))
                .padding()
        }
    }
}
