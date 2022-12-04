//
//  LiveLeagueView.swift
//  6PAS
//
//  Created by Fatih Toker on 6.11.2022.
//

import SwiftUI
import Kingfisher

struct LiveLeagueUIView: View {
    
    var leagueLogo : String
    var leagueName : String
    
    var body: some View {
        HStack{
            KFImage(URL(string: leagueLogo))
                .resizable()
                .frame(width: 30, height: 30)
                
            
            Text(leagueName)
                .font(Font.custom(FontsManager.RobotoFont.regular, size: 12))
            
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
      
    }
}

struct LiveLeagueUIView_Previews: PreviewProvider {
    static var previews: some View {
        LiveLeagueUIView(leagueLogo: "https://www.api-football.com/public/img/home1/hero-banner.png", leagueName: "Spor toto")
            .previewLayout(.sizeThatFits)
    }
}
