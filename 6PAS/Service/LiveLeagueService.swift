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
    
   
    @Published public var liveLeagueModel = [LiveLeagueModel]()
    
  
    
    private let BASE_URL : String = "https://v3.football.api-sports.io"
    
    init(){
        print("hello-1")
        FetchData(path: "/odds/live")
        
    }
    
    
    func FetchData(path : String){
        let header : HTTPHeaders = [
            "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
            "x-rapidapi-host" : "api-football-v1.p.rapidapi.com"
                
        ]
 
        
   
        
            AF.request( URL(string: BASE_URL + path)!, headers: header).responseData{ (data) in
                let json = try! JSON(data: data.data!)
                print(json)
            
                for i in json{
                    for (j, _) in i.1.enumerated(){
                       
                        if i.1[j]["fixture"]["id"].exists(){
                                
                            let fixtureID = i.1[j]["fixture"]["id"].stringValue
                            
                         
                            let params = ["id": fixtureID]
                            
                            AF.request( URL(string: self.BASE_URL + "/fixtures")!, method: .get, parameters: params, headers: header).responseData { (data) in
                                
                                let json = try! JSON(data: data.data!)
                                print(json)
                                for i in json{
                                    if i.1.arrayValue.count == 1{
                                            //print(i.1.arrayValue[0]["fixture"]["status"]["elapsed"].stringValue)
                                       
                                        let fixtureID = i.1.arrayValue[0]["fixture"]["id"].stringValue
                                        let elapseedTime = i.1.arrayValue[0]["fixture"]["status"]["elapsed"].stringValue
                                        
                                        let homeScore = i.1.arrayValue[0]["goals"]["home"].stringValue
                                        let homeLogo = i.1.arrayValue[0]["teams"]["home"]["logo"].stringValue
                                        let homeName = i.1.arrayValue[0]["teams"]["home"]["name"].stringValue
                                            
                                        let awayScore = i.1.arrayValue[0]["goals"]["away"].stringValue
                                        let awayLogo = i.1.arrayValue[0]["teams"]["away"]["logo"].stringValue
                                        let awayName = i.1.arrayValue[0]["teams"]["away"]["name"].stringValue
                                           
                                           
                                        self.liveLeagueModel.append(LiveLeagueModel(fixtureID: fixtureID, elapsedTime: elapseedTime, homeTeamName: homeName, homeTeamLogo: homeLogo, homeTeamScore: homeScore, awayTeamName: awayName, awayTeamLogo: awayLogo, awayTeamScore: awayScore))
                                            
                                    }
                                }
                                 
                            }
                            
                        }
                    }
               }
        }
        
    }
}


