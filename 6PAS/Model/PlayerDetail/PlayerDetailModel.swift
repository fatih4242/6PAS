//
//  PlayerDetailModel.swift
//  6PAS
//
//  Created by Fatih Toker on 23.11.2022.
//

import Foundation
struct PlayerDetailModel : Identifiable{
    var id = UUID()
    
    var playerId : String
    var photo : String
    var name : String
    var teamLogo : String
}
