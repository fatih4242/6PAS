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
    
    @Published var liveLeagueModel = [LiveLeagueModel]()
    
    private let BASE_URL : String = "https://v3.football.api-sports.io"
    
    init(path : String){
        let header : HTTPHeaders = [
            "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba"
        ]
        
        
        AF.request( URL(string: BASE_URL + path)!, headers: header).responseData{ (data) in
            let json = try! JSON(data: data.data!)
            
           for i in json{
               
               for (j, _) in i.1.enumerated(){
                   
                   if i.1[j]["league"].exists() {
                       
                       //print(i.1[j]["league"]["id"])
                       let leagueID = i.1[j]["league"]["id"].stringValue
                       
                       let params = ["id": leagueID]
                       AF.request( URL(string: self.BASE_URL+"/leagues" )!, method: .get, parameters: params, headers: header).responseData { (data) in
                           let json = try! JSON(data: data.data!)
                           for i in json{
                               let logo = i.1[0]["league"]["logo"].stringValue
                               let name = i.1[0]["league"]["name"].stringValue
                               if !logo.isEmpty && !name.isEmpty{
                                   print("logo " + logo)
                                   print("name " + name)
                                   self.liveLeagueModel.append(LiveLeagueModel(id: leagueID, name: name, imageURL: logo))
                               }
                              
                             
                           }
                           
                       }
                   }
                 
               }
               
               
           }
        }
    }
    
    
}


