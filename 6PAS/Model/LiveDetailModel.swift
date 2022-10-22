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
    
    
}

