//
//  WhiteButton.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/19/20.
//

import SwiftUI

struct PlayButton: View {
    let text: String
    let imageName: String
    var backgroundColor: Color = Color.white
    
    
    var action: () -> Void
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            HStack{
                Spacer()
                Image(systemName: imageName)
                    .font(.headline)
                    
                Text(text)
                    .font(.system(size: 16))
                    .bold()
                Spacer()
            }
            .padding(.vertical,6)
            .background(backgroundColor)
            .foregroundColor(backgroundColor == Color.white ? .black : .white)
            .cornerRadius(3)
            
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButton(text: "Play", imageName: "play.fill") {
            
        }
    }
}
