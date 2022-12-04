import Foundation
import Alamofire
import SwiftyJSON


class StandingsViewModel : ObservableObject{
    
    init(service : IStandingsService, params : [String : String]) {
        self.service = service
  
        self.params = params
        GetStandingsData()
    }
    
    
    private let service : IStandingsService

    var params : [String : String]
    
    @Published var standingModel = [StandingsModel]()
    @Published var isComplete : Bool?
    
    private func GetStandingsData(){
        self.service.GetStandings(params: self.params,path: "/standings") { [self] (response, status) in
            self.isComplete = status
            let json = try! JSON(data: response.data!)
        
            for i in json{
                if i.1.arrayValue.count > 0{
                    for j in 0..<(i.1.arrayValue[0]["league"]["standings"][0].arrayValue.count){
                        
                        let teamLogo = i.1.arrayValue[0]["league"]["standings"][0][j]["team"]["logo"].stringValue
                        let teamName = i.1.arrayValue[0]["league"]["standings"][0][j]["team"]["name"].stringValue
                        let teamID = i.1.arrayValue[0]["league"]["standings"][0][j]["team"]["id"].stringValue
                        let teamRank = i.1.arrayValue[0]["league"]["standings"][0][j]["rank"].stringValue
                        
                        let teamPlayed = i.1.arrayValue[0]["league"]["standings"][0][j]["all"]["played"].stringValue
                        let teamGoalFor = i.1.arrayValue[0]["league"]["standings"][0][j]["all"]["goals"]["for"].stringValue
                        
                        let teamGoalAgainst = i.1.arrayValue[0]["league"]["standings"][0][j]["all"]["goals"]["against"].stringValue
                        let teamPoint = i.1.arrayValue[0]["league"]["standings"][0][j]["points"].stringValue
                        
                        
                        
                        self.standingModel.append(StandingsModel(teamId: teamID, teamRank: teamRank, teamLogo: teamLogo, teamName: teamName, teamPlayed: teamPlayed, teamGoalFor: teamGoalFor, teamGoalAgainst: teamGoalAgainst, teamPoint: teamPoint))
                        
                    }
                }
                
               
                
            }
        }
    }
}
