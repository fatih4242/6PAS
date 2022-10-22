//
//  LiveDetailService.swift
//  6PAS
//
//  Created by Fatih Toker on 21.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON


class LiveDetailService : ObservableObject{
    
    @Published var liveDetailModel = [LiveDetailModel]()
    
    private let BASE_URL : String = "https://v3.football.api-sports.io"

    init(path : String, fixtureID : String){
        
        GetData(path: path, fixtureID: fixtureID)
    }
    func GetData(path : String, fixtureID : String){
        let header : HTTPHeaders = [
            "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
            "x-ratelimit-requests-limit" : "70000"
            
        ]
        
        if fixtureID != ""{
            let params = ["id": fixtureID]
            AF.request( URL(string: BASE_URL + path)!, method: .get, parameters: params, headers: header).responseData{ (data) in
                //print(data.response)
                let json = try! JSON(data: data.data!)
                //print(json)
                
                for i in json{
                    if i.1.arrayValue.count > 0{
                        print(i.1.arrayValue[0]["teams"])
                        print(i.1.arrayValue[0]["teams"]["away"]["name"])
                        
                        let homeName = i.1.arrayValue[0]["teams"]["home"]["name"].stringValue
                        let awayName = i.1.arrayValue[0]["teams"]["away"]["name"].stringValue
                        
                        let homeLogo = i.1.arrayValue[0]["teams"]["home"]["logo"].stringValue
                        let awayLogo = i.1.arrayValue[0]["teams"]["away"]["logo"].stringValue
                        
                        self.liveDetailModel.append(LiveDetailModel(homeName: homeName, awayName: awayName, homeLogo: URL(string: homeLogo)!, awayLogo: URL(string: awayLogo)!))
                    }
                  
                  
                }
            }
        }
    }
}
