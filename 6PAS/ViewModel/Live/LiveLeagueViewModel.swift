import Foundation
import Alamofire
import SwiftyJSON

class LiveLeagueViewModel : ObservableObject{
    
    
    
    init(service : ILiveLeagueService) {
        self.service = service
        fetchData()
    }
    
    private let service : ILiveLeagueService?
    @Published var liveLeagueModel = [LiveLeagueModel]()
    @Published var isComplete : Bool?
    
    let header : HTTPHeaders = [
        "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
        "x-rapidapi-host" : "api-football-v1.p.rapidapi.com"
    ]
    private let BASE_URL : String = "https://v3.football.api-sports.io"

    
    private func fetchData(){
        service?.FetchData(path: "/odds/live") { (response, status) in
            self.isComplete = status
            let json = try! JSON(data: response.data!)
            for i in json{
                //for (j, _) in i.1.enumerated(){
                for j in 1...100{
                    if i.1[j].count > 0{
                    //if i.1[j]["fixture"]["id"].exists(){
                        let fixtureID = i.1[j]["fixture"]["id"].stringValue
                        let params = ["id": fixtureID]
                        AF.request( URL(string: self.BASE_URL + "/fixtures")!, method: .get, parameters: params, headers: self.header).responseData { (data) in
                            
                            let json = try! JSON(data: data.data!)
                            
                            for i in json{
                                if i.1.arrayValue.count > 0{
                                    let fixtureID = i.1.arrayValue[0]["fixture"]["id"].stringValue
                                    let elapseedTime = i.1.arrayValue[0]["fixture"]["status"]["elapsed"].stringValue
                                    
                                    let leagueLogo = i.1.arrayValue[0]["league"]["logo"].stringValue
                                    let leagueName = i.1.arrayValue[0]["league"]["name"].stringValue
                                    
                                    
                                    let homeScore = i.1.arrayValue[0]["goals"]["home"].stringValue
                                    let homeLogo = i.1.arrayValue[0]["teams"]["home"]["logo"].stringValue
                                    let homeName = i.1.arrayValue[0]["teams"]["home"]["name"].stringValue
                                        
                                    let awayScore = i.1.arrayValue[0]["goals"]["away"].stringValue
                                    let awayLogo = i.1.arrayValue[0]["teams"]["away"]["logo"].stringValue
                                    let awayName = i.1.arrayValue[0]["teams"]["away"]["name"].stringValue
                                       
                                    self.liveLeagueModel.append(LiveLeagueModel(fixtureID: fixtureID, elapsedTime: elapseedTime, leagueLogo: leagueLogo, leagueName: leagueName, homeTeamName: homeName, homeTeamLogo: homeLogo, homeTeamScore: homeScore, awayTeamName: awayName, awayTeamLogo: awayLogo, awayTeamScore: awayScore))
                                        
                                }
                            }
                        }
                    }
                }
           }
        }
    }
}
