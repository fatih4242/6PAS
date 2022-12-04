//
//  LiveDetailService.swift
//  6PAS
//
//  Created by Fatih Toker on 21.10.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ILiveDetailService{
    
    func GetEvents(fixtureID : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void)
    func GetData(path : String, fixtureID : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void)
    

}
class LiveDetailService : ILiveDetailService{
    

    
    private let BASE_URL : String = "https://v3.football.api-sports.io"

    let header : HTTPHeaders = [
    "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
    "x-ratelimit-requests-limit" : "70000"
    ]
    
    func GetData(path : String, fixtureID : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void){
        if fixtureID != ""{
            let params = ["id": fixtureID]
            AF.request( URL(string: BASE_URL + path)!, method: .get, parameters: params, headers: self.header).responseData{ (data) in
                onSucces(data, true)
            }
        }
    }
    
    func GetEvents(fixtureID : String, onSucces : @escaping (AFDataResponse<Data>, Bool) -> Void){
        
        if fixtureID != ""{
            let params = ["fixture": fixtureID]
            
            AF.request(URL(string: BASE_URL + "/fixtures/events")!, method: .get, parameters: params, headers: self.header).responseData{(data) in
                onSucces(data, true)
            }
        }else{
            print("Getevents Fixture ID is null")
        }
        
    }
}
