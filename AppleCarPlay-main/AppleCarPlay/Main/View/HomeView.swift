import SwiftUI

struct HomeView: View {

    var body: some View {
        
        ScrollView{
            
            VStack{
                
                Text("My Garage")
                    .foregroundStyle(Color.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            }
            
            UserGarageView()
            
            NearbyChargersView()
            
        }
        .background(Color("bck"))
    }
}

#Preview {
    HomeView()
}
