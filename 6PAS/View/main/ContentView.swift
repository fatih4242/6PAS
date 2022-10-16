//
//  ContentView.swift
//  6PAS
//
//  Created by Fatih Toker on 15.10.2022.
//

import SwiftUI

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
        
        NavigationView{
            
            
            ZStack{
                Color.gray.opacity(0.1)
       
                VStack{
                    LiveUILeagueView(ImageUrl: "home", leagueName: "Süper lig")
                    LiveUIView(date: "20:20", elapsedTime: "20", homeLogo: "logo", homeTeamName: "Abc", homeScore: "2", awayLogo: "logo", awayTeamName: "Cba", awayScore: "3")
                        .padding()
                        .cornerRadius(50, antialiased: false)
                    
                   
                        
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
    
    var body: some View {
        VStack{
            
            ZStack{
               
                //Content
                VStack{
                    NavigationBarView()
                        
                TabView{
                   
                     
                        LiveView()
                            .tabItem {
                                Image(systemName: "dot.radiowaves.left.and.right")
                                Text("Canlı")
                            }
                        HomeView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Anasayfa")
                            }
                        ProfileView()
                            .tabItem {
                                Image(systemName: "person")
                                Text("Profil")
                            }
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
