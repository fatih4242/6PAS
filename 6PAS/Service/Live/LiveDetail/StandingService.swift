//
//  StandingService.swift
//  6PAS
//
//  Created by Fatih Toker on 10.11.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol IStandingsService{
    
    func GetStandings(params : [String : String] ,path : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void)
    
}
class StandingsService : IStandingsService{
    
    private let BASE_URL : String = "https://v3.football.api-sports.io"

    let header : HTTPHeaders = [
        "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
        "x-ratelimit-requests-limit" : "70000"
    ]
    
    func GetStandings(params : [String : String] ,path : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void){
        if params["league"] != ""{
            
            //need fixtureID
           
            AF.request( URL(string: BASE_URL + path)!, method: .get, parameters: params, headers: self.header).responseData{ (data) in
                onSucces(data, true)
            }
        }
    }
    
    
}
