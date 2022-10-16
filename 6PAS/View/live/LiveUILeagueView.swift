//
//  LiveUILeagueView.swift
//  6PAS
//
//  Created by Fatih Toker on 16.10.2022.
//

import SwiftUI

struct LiveUILeagueView: View {
    var ImageUrl : String
    var leagueName : String
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string:ImageUrl))
                .frame(width:50, height: 50)
            Text(leagueName)
            Spacer()
        }
        .padding()
        .background(.white)
    }
}


