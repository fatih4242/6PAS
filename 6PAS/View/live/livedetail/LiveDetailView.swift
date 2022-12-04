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
    @State var currentTab : Int = 0
    @StateObject var league : LiveDetailViewModel
    

    var body: some View {
        GeometryReader{g in
            VStack{
                HStack{
                    VStack{
                        if league.isComplete == true{
                            KFImage(league.liveDetailModel[0].homeLogo)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }else{
                            Image("logo")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        if league.isComplete == true {
                            Text(league.liveDetailModel[0].homeName)
                                .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                        }else{
                            Text("hhelo")
                        }
                        
                        
                    }
                    
                    VStack{
                        if league.isComplete == true{
                            Text("'"+league.liveDetailModel[0].elapsedTime)
                                .foregroundColor(.red)
                            
                                .font(.custom("", size: 12))
                            
                            Text(league.liveDetailModel[0].homeGoal + " - " + league.liveDetailModel[0].awayGoal)
                                .font(.custom("Avenir-Heavy", size: 30))
                                .fontWeight(.bold)
                                .bold()
                                .foregroundColor(.red)
                            Text(league.liveDetailModel[0].matchHalf)
                        }else{
                            Text(" " + " - " + " ")
                                .font(.custom("Avenir-Heavy", size: 40))
                                .fontWeight(.bold)
                                .bold()
                                .foregroundColor(.red)
                            Text("-")
                        }
                        
                    }
                    .padding()
                    
                    VStack{
                        if league.isComplete == true{
                            KFImage(league.liveDetailModel[0].awayLogo)
                                .resizable()
                                .frame(width: 50, height: 50)
                        }else{
                            Image("logo")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        if league.isComplete == true {
                            Text(league.liveDetailModel[0].awayName)
                                .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                                
                        }else{
                            Text("hhelo")
                        }
                        
                    }
                    
                }
                
            
                TabBarView(currentTab: self.$currentTab)
                TabView(selection: self.$currentTab) {
                    GeneralView(league: LiveDetailViewModel(service: LiveDetailService(), fixtureID: league.fixtureID)).tag(0)
                    
                    LineupsUIView(lineups: LineupsViewModel(service: LineupsService(), fixtureID: league.fixtureID)).tag(1)
                    
                    if league.liveDetailModel.count > 0{
                        StandingView(standing: StandingsViewModel(service: StandingsService(), params: ["league" : league.leagueID, "season": league.leagueSeason]), teamHome: league.liveDetailModel[0].homeName, teamAway: league.liveDetailModel[0].awayName).tag(3)
                    }
                    
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea(.all)
                
                Spacer()
            }
        }
    }
    
    
}
struct TabBarView : View{
    @Binding var currentTab : Int
    var tabBarOptions : [String] = ["Genel", "Kadro", "Tahmin","Fikstür"]
    @Namespace var namespace
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20) {
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)), id: \.0) { index, name in
                    TabBarItem(currentTab: self.$currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
                    
                }
            }
            .padding(.horizontal)
        }
        .background(Color("bg-2"))
        .frame(height: 50)
    }
}


struct TabBarItem : View{
    @Binding var currentTab : Int
    let namespace : Namespace.ID
    
    var tabBarItemName : String
    var tab : Int
    
    var body: some View{
        Button{
            self.currentTab = tab
        }label: {
            VStack{
                Spacer()
                Text(tabBarItemName)
                    .foregroundColor(.white)
                if currentTab == tab{
                    Color.white
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline",
                                            in: namespace,
                                               properties: .frame)
                }else{
                    Color.clear.frame(height: 2)
                }
            }
            .animation(.spring(), value: currentTab)
        }
        .buttonStyle(.plain)
    }
}

