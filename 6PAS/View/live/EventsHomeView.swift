//
//  EventsView.swift
//  6PAS
//
//  Created by Fatih Toker on 2.11.2022.
//

import SwiftUI

struct EventsHomeView: View {
    
    var elapsedTime : String
    var type : String
    var player : String
    
    @State var isHome : Bool
    

    var detail : String
    var assist : String
    
    var body: some View {
      
        if isHome == true{
            VStack{
                
                HStack{
                    Text("\(elapsedTime)'")
                        .font(.custom(FontsManager.RobotoFont.regular, size: 15))
                        .padding()
                        .foregroundColor(.red)
                    
                    EventsTypeView(player: player, type: type, detail: detail, assist: assist, isHome: true)
                        
                    
                    
                    
                }
                
            }.frame(width: UIScreen.main.bounds.width, alignment: .leading)
        }else{
            VStack{
                
                HStack{
            
                   
                    
                    EventsTypeView(player: player,type: type, detail: detail, assist: assist, isHome: false)
                    
                    Text("\(elapsedTime)'")
                        .font(.custom(FontsManager.RobotoFont.regular, size: 15))
                        .padding()
                        .foregroundColor(.red)
                    
                    
                }
                
                
                
            }.frame(width: UIScreen.main.bounds.width, alignment: .trailing)
        }
        
    }
    struct LiveDetailView_Previews: PreviewProvider {
        static var previews: some View {
            EventsHomeView(elapsedTime: "19'", type: "Goal", player: "Fernando", isHome: false, detail: "a", assist: "a")
            
        }
    }
}

