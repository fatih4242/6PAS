//
//  LiveView.swift
//  6PAS
//
//  Created by Fatih Toker on 22.10.2022.
//

import SwiftUI


struct LiveView: View{
    @ObservedObject var league = LiveLeagueService()
    
   
    
    @State public var leagueName : String = "Live"
    @State public var leagueLogo : String = "Live"
    
    var body: some View{
        NavigationView {
            VStack{
              
                List(league.liveLeagueModel) {response in
                    //Text("\(self.league.liveLeagueTeamModel[i].awayTeamScore)")
                    NavigationLink {
                        LiveDetailView( league: LiveDetailService(path: "/fixtures", fixtureID: response.fixtureID))
                    } label: {
                        LiveUIView( elapsedTime: response.elapsedTime , fixtureID: response.fixtureID ,  homeTeamName: response.homeTeamName, homeScore: response.homeTeamScore,  awayTeamName: response.awayTeamName, awayScore: response.homeTeamScore)
                        
                            
                    }.buttonStyle(PlainButtonStyle())
                        .listStyle(PlainListStyle())

                   
                }
                .listStyle(PlainListStyle())
                
                
               
            }
            
       
           
        }
       
    }
}

struct ProfileView: View{
    var body: some View{
     
        VStack{
            Image(systemName: "person")
                .frame(width: 50,height: 50, alignment: .center)
        }
    }
}


struct ContentView: View {
    @State var animate : Bool = false
    @State var showSplash : Bool = true
    @State var selection = 1
    
    
    var body: some View {
        VStack{
            
            ZStack{
               
                //Content
                VStack{
                    NavigationBarView()
                        
                TabView(selection: $selection){
                    
                     
                    LiveView(leagueName: "", leagueLogo: "" )
                            .tabItem {
                                Image(systemName: "dot.radiowaves.left.and.right")
                                Text("Canlı")
                            }.tag(2)
                           
                       
                        HomeView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Anasayfa")
                            }.tag(1)
                            
                        ProfileView()
                            .tabItem {
                                Image(systemName: "person")
                                Text("Profil")
                            }.tag(3)
                    }
                    
                }
                .background(Color("bg-2"))
                SplashScreen(showSplash: self.showSplash, animate: self.animate)
            }
           
        }
        

        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                animate.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+1.5){
                showSplash.toggle()
            }
        }.background(Color("bg").edgesIgnoringSafeArea(.all))
    }

    

   
}

struct LiveView_Previews: PreviewProvider {
    static var previews: some View {
        LiveView()
    }
}
