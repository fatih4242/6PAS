//
//  PlayerTransferViewModel.swift
//  6PAS
//
//  Created by Fatih Toker on 2.12.2022.
//

import Foundation
import Alamofire
import SwiftyJSON

class PlayerCareerViewModel : ObservableObject{
    
    
    init(service : IPlayerCareerService, params : [String : String]) {
        self.params = params
        self.service = service
        fetchData()
    }
    
    private let service : IPlayerCareerService?
    var params : [String : String]
    @Published var transferDetailModel = [PlayerCareerModel]()
    @Published var isComplete : Bool?
    
    let header : HTTPHeaders = [
        "x-rapidapi-key" : "1571fa6e8b7a64ae9f0e15d422ecb6ba",
        "x-rapidapi-host" : "api-football-v1.p.rapidapi.com"
    ]
    private let BASE_URL : String = "https://v3.football.api-sports.io"
    
    private func fetchData(){
        service?.FetchData(params: self.params, path: "/players/seasons") { (response, status) in
            self.isComplete = status
            let json = try! JSON(data: response.data!)
            for i in json{
                print(i.1)
            }
        }
    }
}
