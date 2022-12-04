//
//  EventsTypeView.swift
//  6PAS
//
//  Created by Fatih Toker on 15.11.2022.
//

import SwiftUI

struct EventsTypeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var player : String
    var type : String
    var detail : String
    var assist : String
    var isHome : Bool
    
    var body: some View {
        HStack{
            if !isHome{
                if type == "subst"{
                    VStack{
                        Text(player)
                            .font(.custom(FontsManager.RobotoFont.light, size: 14))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Text(assist)
                            .font(.custom(FontsManager.RobotoFont.light, size: 12))
                            .foregroundColor(.gray)
                    }
                    
                }else{
                    Text(player)
                        .font(.custom(FontsManager.RobotoFont.light, size: 12))
                }
            }
            if type == "Goal"{
                
                Image(colorScheme == .dark ? "white-ball" : "black-ball")
                    .resizable()
                    .frame(width: 20, height: 20)
                
            }else if type == "Card"{
                
                if detail == "Yellow Card"{
                    
                    Image("yellow-card")
                        .resizable()
                        .frame(width: 10, height: 20)
                        
                }else if detail == "Red Card"{
                    
                    Image("red-card")
                        .resizable()
                        .frame(width: 10, height: 20)
                    
                }
            }else if type == "subst"{
                Image("sub")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            if isHome{
                if type == "subst"{
                    VStack{
                        Text(player)
                            .font(.custom(FontsManager.RobotoFont.light, size: 14))
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                        Text(assist)
                            .font(.custom(FontsManager.RobotoFont.light, size: 12))
                            .foregroundColor(.gray)
                    }
                    
                }else{
                    Text(player)
                        .font(.custom(FontsManager.RobotoFont.light, size: 12))
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
            }
        }
        
        
    }
}

struct EventsTypeView_Previews: PreviewProvider {
    static var previews: some View {
        EventsTypeView( player: "Fernando", type: "Card", detail: "Red Card", assist: "Assist", isHome: true)
    }
}
