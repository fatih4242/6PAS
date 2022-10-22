//
//  LiveLeagueTeamModel.swift
//  6PAS
//
//  Created by Fatih Toker on 18.10.2022.
//

import Foundation
struct LiveLeagueModel : Identifiable{
    var id  = UUID()
    
    var fixtureID : String
   
    var elapsedTime : String
   
    //Home Team
    var homeTeamName : String
    var homeTeamLogo : String
    var homeTeamScore : String
    //Away Team
    var awayTeamName : String
    var awayTeamLogo : String
    var awayTeamScore : String
    
}
