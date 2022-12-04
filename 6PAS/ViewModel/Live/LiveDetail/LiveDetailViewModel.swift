//
//  LiveDetailViewModel.swift
//  6PAS
//
//  Created by Fatih Toker on 1.11.2022.
//

import Foundation
import SwiftyJSON
import Alamofire
import SwiftUI


class LiveDetailViewModel : ObservableObject{
    
    
    init(service : ILiveDetailService, fixtureID : String) {
        self.service = service
        self.fixtureID = fixtureID
        fetchData()
    }
    
    var fixtureID : String
    private let service : ILiveDetailService

    
    @Published var liveDetailModel = [LiveDetailModel]()
    @Published var eventsModel = [EventsModel]()
    
    @Published var isComplete : Bool?
    @Published var isEventsComplete : Bool!
    
    @Published var leagueID : String = ""
    @Published var leagueSeason : String = ""
    
    let header : HTTPHeaders = [
        "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
        "x-rapidapi-host" : "api-football-v1.p.rapidapi.com"
    ]
        
    private func fetchData(){
        service.GetData(path: "/fixtures",fixtureID: fixtureID, onSucces: { (response, status) in
            self.isComplete = status
            let json = try! JSON(data: response.data!)
           
            for i in json{
                
                if i.1.arrayValue.count > 0{
                    self.leagueID = i.1.arrayValue[0]["league"]["id"].stringValue
                    self.leagueSeason = i.1.arrayValue[0]["league"]["season"].stringValue
                    
                    let homeName = i.1.arrayValue[0]["teams"]["home"]["name"].stringValue
                    let awayName = i.1.arrayValue[0]["teams"]["away"]["name"].stringValue
                    
                    let homeLogo = i.1.arrayValue[0]["teams"]["home"]["logo"].stringValue
                    let awayLogo = i.1.arrayValue[0]["teams"]["away"]["logo"].stringValue
                    
                    let homeGoal = i.1.arrayValue[0]["goals"]["home"].stringValue
                    let awayGoal = i.1.arrayValue[0]["goals"]["away"].stringValue
                    
                    let matchHalf = i.1.arrayValue[0]["fixture"]["status"]["long"].stringValue
                    let elapsedTime = i.1.arrayValue[0]["fixture"]["status"]["elapsed"].stringValue
                    
                    let referee = i.1.arrayValue[0]["fixture"]["referee"].stringValue
                    let venueName = i.1.arrayValue[0]["fixture"]["venue"]["name"].stringValue
                    
                    self.liveDetailModel.append(LiveDetailModel(homeName: homeName, awayName: awayName, homeLogo: URL(string: homeLogo)!, awayLogo: URL(string: awayLogo)!, homeGoal: homeGoal, awayGoal: awayGoal, matchHalf: matchHalf, elapsedTime: elapsedTime, referee: referee, venue: venueName))
            
                }
            }
            self.getEvents()
            
        })
    }
    private func getEvents(){
        service.GetEvents(fixtureID: self.fixtureID) { (response, status) in
            self.isEventsComplete = status
            let json = try! JSON(data: response.data!)
         
            //player->name, team->name, time->elapsed, type, detail
            for i in json {
                for index in 0..<i.1.arrayValue.count {
                    self.eventsModel.append(EventsModel(team: i.1.arrayValue[index]["team"]["name"].stringValue, player: i.1.arrayValue[index]["player"]["name"].stringValue, type: i.1.arrayValue[index]["type"].stringValue, detail: i.1.arrayValue[index]["detail"].stringValue, assist: i.1.arrayValue[index]["assist"]["name"].stringValue, elapsedTime: i.1.arrayValue[index]["time"]["elapsed"].stringValue))
                  
                }
             
            }
        }
    }
}
