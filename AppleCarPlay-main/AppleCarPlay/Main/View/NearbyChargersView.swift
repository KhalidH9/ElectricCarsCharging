import SwiftUI

struct NearbyChargersView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack{
            
            Text("Nearby Chargers")
                .foregroundStyle(Color.white)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            
            ForEach(vm.chargers, id: \.id) { charger in
                
                HStack(spacing: 15){
                    RemoteImageView(imageURL: "https://source.unsplash.com/random/90x90?CarCharger")
                        .frame(width: 90, height: 90)
                        .cornerRadius(16 * 1)
                    
                    VStack(spacing: 10){
                        
                        Text(charger.name)
                            .font(.title2)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack{
                            Text(charger.location)
                                .font(.callout)
                                .foregroundStyle(Color.gray)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("\(charger.avaPorts) Port Available")
                                .font(.headline)
                                .foregroundStyle(charger.avaPorts < 5 ? Color("yellow") : Color("green"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        
                    }
                }
            }
            .padding()
            .background(Color("rct"))
            .cornerRadius(16 * 1)
            .padding(.horizontal)
        }
        
        .onAppear {
            vm.fetchData()
            vm.fetchPorts()
        }
        
    }
}

#Preview {
    NearbyChargersView()
}
