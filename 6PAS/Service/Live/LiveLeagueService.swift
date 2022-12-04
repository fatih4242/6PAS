//
//  LiveLeagueService.swift
//  6PAS
//
//  Created by Fatih Toker on 16.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ILiveLeagueService{
    func FetchData(path : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void)

}

class LiveLeagueService : ILiveLeagueService{
    
    private let BASE_URL : String = "https://v3.football.api-sports.io"
   
    
    func FetchData(path : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void){
        let header : HTTPHeaders = [
            "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
            "x-rapidapi-host" : "api-football-v1.p.rapidapi.com"
        ]
            AF.request( URL(string: BASE_URL + path)!, headers: header).responseData{ (data) in
                onSucces(data, true)
                //let json = try! JSON(data: data.data!)
        }
    }
}


