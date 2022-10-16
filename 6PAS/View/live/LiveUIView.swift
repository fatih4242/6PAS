//
//  LiveUIView.swift
//  6PAS
//
//  Created by Fatih Toker on 16.10.2022.
//

import SwiftUI

struct LiveUIView: View {
    var date : String
    var elapsedTime : String
    
    //Home Team
    var homeLogo : String
    var homeTeamName : String
    var homeScore : String
    
    //Away Team
    var awayLogo : String
    var awayTeamName : String
    var awayScore : String
    
    var body: some View {
        VStack{
            HStack{
                
                Spacer()
                Text("'"+elapsedTime)
                    .foregroundColor(Color.red)
                    
            }
            HStack{
                Image(homeLogo)
                    .resizable()
                    .frame(width: 30,height: 40)
                Text(homeTeamName)
                Spacer()
                Text(homeScore)
            }
            HStack{
                Image(awayLogo)
                    .resizable()
                    .frame(width: 30,height: 40)
                Text(awayTeamName)
                Spacer()
                Text(awayScore)
            }
        }
        .padding()
        .background(.white)
        
    }
}


