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
        VStack {
            MapView()
            .frame(height: 200)
            ZStack(alignment: .center) {
//                Circle()
//                .background(/*@START_MENU_TOKEN@*/Color.orange/*@END_MENU_TOKEN@*/)
//                    .padding(.bottom, -130)
//                    .offset(y: -150)
//                    .zIndex(-10)
                CircleImage(imageName: "appLogo", width: 225, height: 225) //with initialization
                .offset(y: -150)
                .padding(.bottom, -130)
                .zIndex(10)
//                Text("Text on Image")
//                    .font(.largeTitle)
//                    .background(Color.black)
//                    .foregroundColor(.white)
            }
            VStack(alignment: .center) {
                Text("Samuel Folledo")
                    .font(.title)
                    .foregroundColor(Color(SettingsService.mainColor))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                
                VStack {
                    Text("5 years")
                    .font(.subheadline)
                    .foregroundColor(Color(SettingsService.darkGrayColor))
                        .multilineTextAlignment(.center)
                    Spacer() //make them stretch as far away as possible
                    Text("Samuel Folledo, the future Apple Inc. owner, loves being surrounded by more knowledgeable programmers beyond his reach. He strives to be the Elon Musk/Steve Wozniak in the tech world, primarily in software developer and plans to develop two of the next technological evolution every humans need.")
                    .font(.subheadline)
                        .foregroundColor(Color(SettingsService.darkGrayColor))
                        .multilineTextAlignment(.center)
//                Button(action: {
////                    self.showingDetail.toggle()
//                }) {
//                    Text("Logout").foregroundColor(Color(SettingsService.blackColor)).bold()
//                        .background(Color(SettingsService.whiteColor))
//                    }
////                .sheet(isPresented: $showingDetail) {
////                    DetailView()
////                }
                }
                .padding(.all, 10) //add padding to all sides
                Spacer()
            }
        .navigationBarTitle("Profile")
        }
        .background(Color(SettingsService.whiteColor))
//        .onAppear { //viewWillAppear
//
//        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
