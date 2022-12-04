//
//  StandingsMode.swift
//  6PAS
//
//  Created by Fatih Toker on 10.11.2022.
//

import Foundation
struct StandingsModel : Identifiable{
    var id = UUID()
    
    var teamId : String
    var teamRank : String
    var teamLogo : String
    var teamName : String
    
    var teamPlayed : String
    
    var teamGoalFor : String
    var teamGoalAgainst : String
    
    var teamPoint : String
    //var teamName
}
