//
//  GeneralView.swift
//  6PAS
//
//  Created by Fatih Toker on 10.11.2022.
//

import SwiftUI

struct GeneralView: View {
    @StateObject var league : LiveDetailViewModel
    var body: some View {
        ScrollView{
            
            Text("Olaylar")
            //.background(.gray)
                .foregroundColor(Color("table-text"))
                .padding(3)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .background(Color("table-bg"))
            
            
            
            
            
            ForEach(league.eventsModel){response in
                EventsHomeView(elapsedTime: response.elapsedTime, type: response.type, player: response.player, isHome: league.liveDetailModel[0].homeName == response.team ? true : false, detail: response.detail, assist: response.assist)
                
            }
            
            VStack{
                VStack{
                    Text("Genel Bilgiler")
                    //.background(.gray)
                        .foregroundColor(Color("table-text"))
                        .padding(3)
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .background(Color("table-bg"))
                
                HStack(alignment: .center){
                    
                    Image("whistle")
                        .resizable()
                        .frame(width: 26, height: 20,alignment: .trailing)
                        .padding(2)
                    Text(league.isComplete == true ? league.liveDetailModel[0].referee : "referee")
                        .font(.custom(FontsManager.RobotoFont.regular, size: 10))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
                HStack(alignment: .center){
                    Image("stadium")
                        .resizable()
                        .frame(width: 30, height: 30,alignment: .trailing)
                        .padding(2)
                    
                    Text(league.isComplete == true ? league.liveDetailModel[0].venue : "venue")
                        .font(.custom(FontsManager.RobotoFont.regular, size: 10))
                }
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                
            }
            Spacer()
            
        }
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView(league: LiveDetailViewModel(service: LiveDetailService(), fixtureID: ""))
    }
}
