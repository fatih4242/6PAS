import SwiftUI
import Kingfisher

struct PlayerDetailView: View {
    @State var currentTab : Int = 0
    @StateObject var player : PlayerDetailViewModel
    
    var body: some View {
        VStack{
            HStack{
                if player.playerDetailModel.count > 0{
                    
                    KFImage(URL(string: player.playerDetailModel[0].photo))
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                    
                    Text(player.playerDetailModel[0].name)
                        .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                    
                    Spacer()
                    
                    KFImage(URL(string: player.playerDetailModel[0].teamLogo))
                        .resizable()
                        .frame(width: 30, height: 30)
                }else{
                    Image("logo")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Spacer()
                    
                    Text("6Pas")
                        .font(.custom(FontsManager.RobotoFont.regular, size: 12))
                    
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
            }
            .frame(width: UIScreen.main.bounds.width/1.2, alignment: .center)
            
            PlayerTabBarView(currentTab: self.$currentTab)
            TabView(selection: self.$currentTab) {
                PlayerCareerView(career: PlayerCareerViewModel(service: PlayerCareerService(), params: ["player" : player.playerDetailModel[0].playerId])).tag(0)
                
                PlayerProfileView().tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea(.all)
            
            Spacer()
            
        }.frame(width: UIScreen.main.bounds.width ,alignment: .center)
    }
}

struct PlayerTabBarView : View{
    
    @Binding var currentTab : Int
    var tabBarOptions : [String] = ["Transfer", "Profil"]
    @Namespace var namespace
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20) {
                ForEach(Array(zip(self.tabBarOptions.indices, self.tabBarOptions)), id: \.0) { index, name in
                    PlayerTabBarItem(currentTab: self.$currentTab, namespace: namespace.self, tabBarItemName: name, tab: index)
                    
                }
            }
            .padding(.horizontal)
        }
        .background(Color("bg-2"))
        .frame(height: 50)
    }
}


struct PlayerTabBarItem : View{
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
struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView(player: PlayerDetailViewModel(service: PlayerDetailService(), params: ["id": "276", "season":"2022"]))
    }
}
