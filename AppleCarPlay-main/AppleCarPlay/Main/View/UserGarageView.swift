import SwiftUI

struct UserGarageView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            
            HStack{
                ForEach(vm.cars, id: \.id) { car in
                    
                    VStack{
                        Text(car.carName)
                            .font(.title2)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack{
                            
                            VStack{
                                
                                HStack{
                                    Image(systemName: "ev.charger")
                                        .foregroundStyle(car.milesLeft < 50 ? Color("yellow") : Color("green"))
                                    
                                    Text("Miles Left: \(car.milesLeft)")
                                        .font(.callout)
                                        .foregroundStyle(Color.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                
                                
                                
                                HStack{
                                    Image(systemName: "gauge.with.dots.needle.67percent")
                                        .foregroundStyle(car.chargePercentage < 30 ? Color("yellow") : Color("green"))
                                    
                                    Text("Charged: \(car.chargePercentage)%")
                                        .font(.callout)
                                        .foregroundStyle(Color.white)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            
                            Spacer(minLength: 30)
                            
                            Image(systemName: "bolt.car")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(Color("green"))
                        }
                    }
                    .padding()
                    .background(Color("rct"))
                    .cornerRadius(16 * 1)
                    .padding(.leading)
                }
            }
        }
        .onAppear {
            vm.fetchData()
            vm.fetchPorts()
        }
    }
}
