//
//  StandingView.swift
//  6PAS
//
//  Created by Fatih Toker on 10.11.2022.
//

import SwiftUI

struct StandingView: View {
    @StateObject var standing : StandingsViewModel
    @Environment(\.colorScheme) var colorScheme
    @State var teamHome : String
    @State var teamAway : String
    
    var body: some View {
        ScrollView{
            HStack{
                Text("#")
                //.background(.gray)
                    .foregroundColor(Color("table-text"))
                    .padding(3)
                    .frame(width: UIScreen.main.bounds.width / 10)
                    
                Text("Takım")
                    .foregroundColor(Color("table-text"))
                    .frame(width: UIScreen.main.bounds.width / 2, alignment: .leading)
                
                Spacer()
                
                Text("O")
                    .foregroundColor(Color("table-text"))
                    .frame(width: UIScreen.main.bounds.width / 10)
                Text("G")
                    .foregroundColor(Color("table-text"))
                    .frame(width: UIScreen.main.bounds.width / 10)
                Text("P")
                    .foregroundColor(Color("table-text"))
                    .frame(width: UIScreen.main.bounds.width / 10)
            }
            .frame(width: UIScreen.main.bounds.width, alignment: .leading)
            .background(Color("table-bg"))
            
            if standing.isComplete == true{
                ForEach(standing.standingModel){response in
                    HStack{
                        Text(response.teamRank)
                        //.background(.gray)
                            .foregroundColor(response.teamRank == "1" ? .white : Color("table-text"))
                            .padding(3)
                            .frame(width: UIScreen.main.bounds.width / 10)
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                            .background(response.teamRank == "1" ? .red : Color("table-bg"))
                            .cornerRadius(30)
                            
                        
                        Text(response.teamName)
                            .foregroundColor( Color("table-text"))
                            .frame(width: UIScreen.main.bounds.width / 2, alignment: .leading)
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                        Spacer()
                        Text(response.teamGoalFor + "-" + response.teamGoalAgainst)
                            .foregroundColor(Color("table-text"))
                            .frame(width: UIScreen.main.bounds.width / 10)
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                        Text(response.teamPlayed)
                            .foregroundColor(Color("table-text"))
                            .frame(width: UIScreen.main.bounds.width / 10)
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                        Text(response.teamPoint)
                            .foregroundColor(Color("table-text"))
                            .frame(width: UIScreen.main.bounds.width / 10)
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                    }
                    .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    .background(self.teamHome == response.teamName || self.teamAway == response.teamName  ? Color("table-bg") : Color.white)
                }
            }
            Spacer()
        }
    }
}

struct StandingView_Previews: PreviewProvider {
    static var previews: some View {
        StandingView(standing: StandingsViewModel(service: StandingsService(), params: ["hello":"hello"]), teamHome: "", teamAway: "")
    }
}
