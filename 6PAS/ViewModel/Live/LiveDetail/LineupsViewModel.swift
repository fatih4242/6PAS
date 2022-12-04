//
//  LineupsViewModel.swift
//  6PAS
//
//  Created by Fatih Toker on 7.11.2022.
//

import Foundation
import Alamofire
import SwiftyJSON


class LineupsViewModel : ObservableObject{
    
    init(service : ILineupsService, fixtureID : String) {
        self.service = service
        self.fixtureID = fixtureID
        GetEventsData()
    }
    
    
    private let service : ILineupsService
    var fixtureID : String
    
    
    var homeTeamID : String = ""
    var awayTeamID : String = ""
    var homeTeamCoachName : String = ""
    var awayTeamCoachName : String = ""
    
    @Published var lineupsModel = [LineupsModel]()
    @Published var subsitutes = [LineupsModel]()
    
    @Published var isComplete : Bool?
    @Published var isCompleteSeason : Bool?
    
    var playerNameSubAway : String = ""
    var playerIDSubAway : String = ""
    var playerNumberSubAway : String = ""
    
    var playerNameSubHome : String = ""
    var playerIDSubHome : String = ""
    var playerNumberSubHome : String = ""
    
    var season : String = ""
    
    var test : String = ""
    
    
    private func GetEventsData(){
        self.service.GetSeason(path: "/fixtures", fixtureID: self.fixtureID) { (response, status) in
            self.isCompleteSeason = status
            let json = try! JSON(data: response.data!)
            
            for i in json{
                if  i.1[0]["league"]["season"] > 0{
                    self.season = i.1[0]["league"]["season"].stringValue
                    print(self.season)
                }
                
            }
        }
            
        self.service.GetLineups(path: "/fixtures/lineups", fixtureID: self.fixtureID) { [self] (response, status) in
            self.isComplete = status
            let json = try! JSON(data: response.data!)
            
            
            for i in json{
                
                if i.1.arrayValue.count > 0{
                    for j in 0..<(i.1.arrayValue[0]["startXI"].arrayValue.count) {
    
                        homeTeamID = i.1.arrayValue[0]["team"]["id"].stringValue
                        awayTeamID = i.1.arrayValue[1]["team"]["id"].stringValue
                    
                        let playerNameHome = i.1.arrayValue[0]["startXI"].arrayValue[j]["player"]["name"].stringValue
                        let playerIDHome = i.1.arrayValue[0]["startXI"].arrayValue[j]["player"]["id"].stringValue
                        let playerNumberHome = i.1.arrayValue[0]["startXI"].arrayValue[j]["player"]["number"].stringValue
                        
                        print(playerNumberHome)
                        
                        let playerNameAway = i.1.arrayValue[1]["startXI"].arrayValue[j]["player"]["name"].stringValue
                        let playerIDAway = i.1.arrayValue[1]["startXI"].arrayValue[j]["player"]["id"].stringValue
                        let playerNumberAway = i.1.arrayValue[1]["startXI"].arrayValue[j]["player"]["number"].stringValue
                        //requirements player Name, player ID, player Numbe
                        self.homeTeamID = i.1.arrayValue[0]["team"]["id"].stringValue
                        self.awayTeamID = i.1.arrayValue[1]["team"]["id"].stringValue
                        
                        self.homeTeamCoachName = i.1.arrayValue[0]["coach"]["name"].stringValue
                        self.awayTeamCoachName = i.1.arrayValue[1]["coach"]["name"].stringValue
                        //print(i.1.arrayValue[0])
                                           
                        self.lineupsModel.append(LineupsModel(season: self.season, playerNameHome: playerNameHome, playerIDHome: playerIDHome, playerNumberHome: playerNumberHome, playerNameAway: playerNameAway, playerIDAway: playerIDAway, playerNumberAway: playerNumberAway))
                    
                    }
                    for j in 0..<(i.1.arrayValue[0]["substitutes"].arrayValue.count) {
                        
                        self.playerNameSubHome = i.1.arrayValue[0]["substitutes"].arrayValue[j]["player"]["name"].stringValue
                        self.playerIDSubHome = i.1.arrayValue[0]["substitutes"].arrayValue[j]["player"]["id"].stringValue
                        self.playerNumberSubHome = i.1.arrayValue[0]["substitutes"].arrayValue[j]["player"]["number"].stringValue
                    
                        /*
                        if  i.1.arrayValue[1]["substitutes"].arrayValue[j].count > 0{
                            self.playerNameSubAway = i.1.arrayValue[1]["substitutes"].arrayValue[j]["player"]["name"].stringValue
                            self.playerIDSubAway = i.1.arrayValue[1]["substitutes"].arrayValue[j]["player"]["id"].stringValue
                            self.playerNumberSubAway = i.1.arrayValue[1]["substitutes"].arrayValue[j]["player"]["number"].stringValue
                        }
                        */
                        self.subsitutes.append(LineupsModel(season: self.season, playerNameHome: playerNameSubHome, playerIDHome: playerIDSubHome, playerNumberHome: playerNumberSubHome, playerNameAway: playerNameSubAway, playerIDAway: playerIDSubAway, playerNumberAway: playerNumberSubAway))
                    }
                }
            }
        }
    }
    
}
