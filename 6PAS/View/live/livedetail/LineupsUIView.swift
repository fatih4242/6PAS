//
//  LineupsUIView.swift
//  6PAS
//
//  Created by Fatih Toker on 7.11.2022.
//

import SwiftUI

struct LineupsUIView: View {
    
    @StateObject var lineups : LineupsViewModel
    
    @State private var firstStart : Bool = true
    
    var body: some View {
        
     
        ScrollView{
            Text("Kadro")
            //.background(.gray)
                .foregroundColor(Color("table-text"))
                .padding(3)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .background(Color("table-bg"))
            ForEach(lineups.lineupsModel){response in
                HStack{
                    
                    NavigationLink(destination: {
                        PlayerDetailView(player: PlayerDetailViewModel(service: PlayerDetailService(), params: ["id" : response.playerIDHome, "season": response.season]))
                            
                    }, label: {
                        HStack{
                            Text(response.playerNumberHome)
                                .padding()
                                .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                            
                            Text(response.playerNameHome)
                                .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                        }
                        .frame(width: UIScreen.main.bounds.width / 2, alignment: .leading)
                    })
                    HStack{
                        
                        Text(response.playerNameAway)
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                        
                        
                        Text(response.playerNumberAway)
                            .padding()
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                    }
                    .frame(width: UIScreen.main.bounds.width / 2, alignment: .trailing)
                }
            }
            Text("Yedekler")
            //.background(.gray)
                .foregroundColor(Color("table-text"))
                .padding(3)
                .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                .background(Color("table-bg"))
            
            ForEach(lineups.subsitutes){response in
                HStack{
                    HStack{
                        Text(response.playerNumberHome)
                            .padding()
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                        
                        Text(response.playerNameHome)
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))

                    }
                    .frame(width: UIScreen.main.bounds.width / 2, alignment: .leading)
                    HStack{
                        Text(response.playerNameAway)
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                        
                        
                        Text(response.playerNumberAway)
                            .padding()
                            .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                    }
                    .frame(width: UIScreen.main.bounds.width / 2, alignment: .trailing)
                }
            }

        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct LineupsUIView_Previews: PreviewProvider {
    static var previews: some View {
        LineupsUIView(lineups: LineupsViewModel(service: LineupsService(), fixtureID: ""))
    }
}
