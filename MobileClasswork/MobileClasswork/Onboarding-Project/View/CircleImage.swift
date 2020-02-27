//
//  CircleImage.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/27/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable() //make the image resizable and accept aspect fit
//        .scaledToFill()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: width, height: height) //size of image
        .clipShape(
            Circle()
        ) //clips the shape
        .overlay(
            Circle().stroke(Color.gray, lineWidth: 4)
                .padding(.all, -10) //makes the circle stroke bigger than the imge
            .background(Color.white)
        )
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "migraine", width: 225, height: 225)
    }
}
