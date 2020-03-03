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
        Image(uiImage: UIImage(named: imageName)!)
            .resizable() //make the image resizable and accept aspect fit
//        .scaledToFill()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: width, height: height, alignment: .top) //size of image
//        .colorMultiply(Color(SettingsService.shared.darkGrayColor))
        
        .overlay(
            Circle().stroke(Color.gray, lineWidth: 4)
                .padding(.all, 0.0) //makes the circle stroke bigger than the imge
                .background(Color.clear, alignment: .bottom)
        )
            .clipShape(
                Circle()
            ) //clips the image in shape
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageName: "appLogo", width: 225, height: 225)
    }
}
