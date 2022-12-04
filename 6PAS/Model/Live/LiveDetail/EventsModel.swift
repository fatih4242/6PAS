//
//  EventsModel.swift
//  6PAS
//
//  Created by Fatih Toker on 25.10.2022.
//

import Foundation
struct EventsModel : Identifiable{
    //player->name, team->name, time->elapsed, type, detail
    var id = UUID()
    
    var team : String
    var player : String
    var type : String
    var detail : String
    var assist : String
    var elapsedTime : String
    
}
