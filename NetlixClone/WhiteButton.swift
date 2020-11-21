//
//  WhiteButton.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/19/20.
//

import SwiftUI

struct WhiteButton: View {
    let text: String
    let imageName: String
    
    
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
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(3)
            
        })
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static var previews: some View {
        WhiteButton(text: "Play", imageName: "play.fill") {
            
        }
    }
}
