//
//  SplashScreen.swift
//  6PAS
//
//  Created by Fatih Toker on 15.10.2022.
//

import SwiftUI

struct SplashScreen: View {
    var showSplash : Bool = true
    var animate : Bool = false
    
    var body: some View {
        //Splash
        ZStack{
            Color.white
            Image("logo-2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
                .scaleEffect(animate ? 20 : 1)
                //.animation(Animation.easeIn(duration: 1))
                //.animation(Animation.easeIn(duration: 0.5))
                .animation(.easeInOut(duration: 0.5), value: 5)
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.default)
        .opacity(showSplash ? 1 : 0)
    }
}

