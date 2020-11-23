//
//  SmallVerticalButton.swift
//  NetlixClone
//
//  Created by Vishal Lakshminarayanappa on 11/19/20.
//

import SwiftUI

struct SmallVerticalButton: View {
    var text: String
    var isOnImage: String
    var isOffImage: String
    var isOn: Bool
    var color : Color = Color.white
    
    var imageName: String {
        return isOn ? isOnImage : isOffImage
    }
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack{
                Image(systemName: imageName)
                    .foregroundColor(color)
                Text(text)
                    .foregroundColor(color)
                    .font(.system(size: 14))
                    .bold()
            }
        })
    }
}

struct SmallVerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            SmallVerticalButton(text: "My List", isOnImage: "checkmark", isOffImage: "plus", isOn: true) {
                print("hello")
            }
        }
    }
}
