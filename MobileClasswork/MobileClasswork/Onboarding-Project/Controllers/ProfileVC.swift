//
//  ProfileVC.swift
//  MobileClasswork
//
//  Created by Macbook Pro 15 on 2/21/20.
//  Copyright © 2020 SamuelFolledo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Hello Party People in the House!!!")
                .font(.title)
                .foregroundColor(Color(SettingsService.mainColor))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            HStack {
                Text("Samuel Folledo")
                .font(.subheadline)
                .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                Spacer() //make them stretch as far away as possible
                Text("Subscriptions")
                .font(.subheadline)
                .foregroundColor(Color.black)
                    .multilineTextAlignment(.trailing)
            }
            .padding(.all, 10) //add padding to all sides
        }
            
            
            
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
