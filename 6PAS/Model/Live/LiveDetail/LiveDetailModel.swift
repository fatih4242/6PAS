//
//  LiveDetailModel.swift
//  6PAS
//
//  Created by Fatih Toker on 21.10.2022.
//

import Foundation
struct LiveDetailModel : Identifiable{
    var id = UUID()
    
    var homeName : String
    var awayName : String
    
    var homeLogo : URL
    var awayLogo : URL
    
    var homeGoal : String
    var awayGoal : String
    
    var matchHalf : String
    var elapsedTime : String
    
    var referee : String
    var venue : String
}

