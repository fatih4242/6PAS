import Foundation
import Alamofire
import SwiftyJSON

protocol IPlayerCareerService{
    func FetchData(params : [String : String], path : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void)

}

class PlayerCareerService : IPlayerCareerService{
    
    private let BASE_URL : String = "https://v3.football.api-sports.io"
   
    func FetchData(params : [String : String], path : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void){
        let header : HTTPHeaders = [
            "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
            "x-rapidapi-host" : "api-football-v1.p.rapidapi.com"
        ]
        AF.request( URL(string: BASE_URL + path)!, method: .get, parameters: params, headers: header).responseData{ (data) in
                onSucces(data, true)
        }
    }
}
