//
//  LiveUIView.swift
//  6PAS
//
//  Created by Fatih Toker on 16.10.2022.
//

import SwiftUI
import Kingfisher

struct LiveUIView: View {

    var elapsedTime : String
    var fixtureID : String
    
    //Home Team
    var homeTeamName : String
    var homeScore : String
    
    //Away Team
    var awayTeamName : String
    var awayScore : String
    
  
    
    var body: some View {
        GeometryReader{r in
            HStack(alignment: .center){
                    
                Text("'"+elapsedTime)
                    .foregroundColor(.red)
                    .padding()
                    .frame(width: r.size.width/6)
                    .font(.custom("", size: 10))
                    
                Spacer()
                Text(homeTeamName)
                    .frame(width: r.size.width/4, alignment: .trailing)
                    .font(.custom("", size: 10))
                    
                Text(homeScore + " - " + awayScore)
                    .frame(width: r.size.width/8)
                    .font(.custom("", size: 10))
                
                Text(awayTeamName)
                    .frame(width: r.size.width/4, alignment: .leading)
                    .font(.custom("", size: 10))
                    
                Spacer()
                Image(systemName: "star")
                    .frame(width: r.size.width/6)
                    .font(.custom("", size: 14))
                
            }.frame(width: r.size.width)
        }
    }
}
struct LiveUIView_Previews: PreviewProvider {
    static var previews: some View {
        LiveUIView(elapsedTime: "'12", fixtureID: "a",  homeTeamName: "Galatasaray", homeScore: "1",  awayTeamName: "Trabzon", awayScore: "3")
    }
}

