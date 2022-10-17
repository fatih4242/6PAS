//
//  ContentView.swift
//  6PAS
//
//  Created by Fatih Toker on 15.10.2022.
//

import SwiftUI
import SwiftUIMargin
import Kingfisher

struct HomeView: View{
    var body: some View{
        
            ZStack{
                Color.red
            }
          
    }
}
struct LiveView: View{
    @ObservedObject var league = LiveLeagueService(path: "/odds/live")
 
    var body: some View{
  
            ZStack{
                Color.gray.opacity(0.1)
           
                    List(league.liveLeagueModel){response in
                        
                            VStack{
                                LiveUILeagueView(ImageUrl: response.imageURL, leagueName: response.name)
                                    .margin(bottom: 10)
                                Spacer()
                                LiveUIView(date: "20:20", elapsedTime: "20", homeLogo: "logo", homeTeamName: "Abc", homeScore: "2", awayLogo: "logo", awayTeamName: "Cba", awayScore: "3")
                                    .cornerRadius(10, antialiased: false)
                            }
                            
                        
                
            }
       
            
        }
        
        
    }
}

struct ProfileView: View{
    var body: some View{
     
            ZStack{
                Color.blue
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
                    
                     
                    LiveView()
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
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                showSplash.toggle()
            }
        }.background(Color("bg").edgesIgnoringSafeArea(.all))
    }

    

   
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
