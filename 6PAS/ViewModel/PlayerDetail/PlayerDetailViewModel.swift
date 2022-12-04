import Foundation
import Alamofire
import SwiftyJSON

class PlayerDetailViewModel : ObservableObject{
    
    
    init(service : IPlayerDetailService, params : [String : String]) {
        self.params = params
        self.service = service
        fetchData()
    }
    
    private let service : IPlayerDetailService?
    var params : [String : String]
    @Published var playerDetailModel = [PlayerDetailModel]()
    @Published var isComplete : Bool?
    
    let header : HTTPHeaders = [
        "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
        "x-rapidapi-host" : "api-football-v1.p.rapidapi.com"
    ]
    private let BASE_URL : String = "https://v3.football.api-sports.io"

    
    private func fetchData(){
        service?.FetchData(params: self.params, path: "/players") { (response, status) in
            self.isComplete = status
            let json = try! JSON(data: response.data!)
            for i in json{
               
                if i.1.arrayValue.count > 0{
                    //let playerId = i.1.arrayValue[0]["player"]["id"].stringValue
                    let playerName = i.1.arrayValue[0]["player"]["name"].stringValue
                    let playerPhoto = i.1.arrayValue[0]["player"]["photo"].stringValue
                    let teamLogo = i.1.arrayValue[0]["statistics"][0]["team"]["logo"].stringValue
                    
                   
                    self.playerDetailModel.append(PlayerDetailModel(playerId: "playerId", photo: playerPhoto, name: playerName, teamLogo: teamLogo))
                    //print(playerPhoto)
                }
                
            }
        }
    }
}
