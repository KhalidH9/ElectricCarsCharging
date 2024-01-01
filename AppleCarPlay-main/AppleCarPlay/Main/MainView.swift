import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            Group{
                HomeView()
                    .tabItem {
                        VStack{
                            Text("Garage")
                                .foregroundStyle(.black)
                            Image(systemName: "steeringwheel")
                                .foregroundStyle(.black)
                        }
                    }
                
                MapView()
                
                    .tabItem {
                        Label(
                            "Map",systemImage: "map"
                        )
                    }
                ProfileView()
                    .tabItem {
                        Label("Profile",systemImage: "person")
                        
                        
                    }
            }
            .toolbarBackground(.bck, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)

        }
        .tint(.white)
    }
}

#Preview {
    MainView()
}
