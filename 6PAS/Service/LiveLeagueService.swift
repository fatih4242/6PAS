//
//  LiveLeagueService.swift
//  6PAS
//
//  Created by Fatih Toker on 16.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class LiveLeagueService : ObservableObject{
    
    
    
    let BASE_URL : String = "https://v3.football.api-sports.io"
    
    init(path : String){
        let header : HTTPHeaders = [
            "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba"
        ]
     
       AF.request(BASE_URL+path, headers: header).responseData{ (data) in
            let json = try! JSON(data: data.data!)
            
           for i in json{
               for (j, _) in i.1.enumerated() {
                   if i.1[j]["league"]["id"].exists() {
                       print(i.1[j]["league"]["id"])
                   }
               }
               
               
           }
        }
    }
    
    
}


