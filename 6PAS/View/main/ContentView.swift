//
//  ContentView.swift
//  6PAS
//
//  Created by Fatih Toker on 15.10.2022.
//

import SwiftUI
import SwiftUIMargin
import Kingfisher

struct HomeView: View{
    var body: some View{
        
        VStack{
            Image(systemName: "house")
                .frame(width: 50,height: 50, alignment: .center)
        }
          
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
