//
//  LiveDetailView.swift
//  6PAS
//
//  Created by Fatih Toker on 20.10.2022.
//

import SwiftUI
import SlidingTabView
import Kingfisher

struct LiveDetailView: View {
    //public var fixtureFromViewID : String
    @State private var tabIndex = 0
 
    
    //@State var fixtureID : String
    @ObservedObject var league : LiveDetailService
    
    
    var body: some View {
        VStack{
            
            HStack{
                VStack{
                    KFImage(league.liveDetailModel[0].homeLogo)
                        .resizable()
                        .frame(width: 50, height: 50)
                    if league.liveDetailModel.count > 0 {
                        Text(league.liveDetailModel[0].homeName)
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                    }else{
                        Text("hhelo")
                    }
                    
                    
                }
                VStack{
                    Text("1 - 0")
                        .font(.custom("Avenir-Heavy", size: 40))
                        .fontWeight(.bold)
                        .bold()
                        .foregroundColor(.red)
                    Text("1.yarı - 21:31")
                    
                }
                VStack{
                    KFImage(league.liveDetailModel[0].awayLogo)
                        .resizable()
                        .frame(width: 50, height: 50)
                    if league.liveDetailModel.count > 0 {
                        Text(league.liveDetailModel[0].awayName)
                            .font(.custom("", size: 12))
                    }else{
                        Text("hhelo")
                    }
                    
                }
                
            }
           
            SlidingTabView(selection: $tabIndex, tabs: ["Home","Friend", "Settings"],
                           animation: .easeInOut,activeAccentColor: .white,inactiveAccentColor: .white, selectionBarColor: .white , inactiveTabColor: Color("bg-2"), activeTabColor: Color("bg"))
            Spacer()
            if tabIndex == 0{
                
                Text("Home")
                
            }else if tabIndex == 1{
                Text("Friends")
            }else if tabIndex == 2{
                Text("Settings")
            }
            Spacer()
           
        }
        
    }
}


struct LiveDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LiveDetailView( league: LiveDetailService(path: "", fixtureID: ""))
    }
}
