//
//  LiveUILeagueView.swift
//  6PAS
//
//  Created by Fatih Toker on 16.10.2022.
//

import SwiftUI
import Kingfisher

struct LiveUILeagueView: View {
    var ImageUrl : String
    var leagueName : String
    
    var body: some View {
        
        HStack{
            KFImage(URL(string:ImageUrl))
                .resizable()
                .frame(width:50, height: 50)
            Text(leagueName)
            Spacer()
        }
        
    }
}


