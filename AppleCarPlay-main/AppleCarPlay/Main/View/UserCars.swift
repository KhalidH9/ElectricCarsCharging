import SwiftUI

struct UserCars: View {
    
    @StateObject var vm = ViewModel()
    @State var validDriveLicense: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            
            ForEach(vm.user, id: \.id) { users in
                Text("\(users.name) Cars")
                    .font(.title2)
                    .foregroundStyle(Color.white)
            }
            
            ForEach(vm.cars, id: \.id) { car in
                VStack{
                    HStack{
                        Text("Car Name:")
                        Text("\(car.carName).")
                        
                        Spacer()
                        
                        Text("Car Model:")
                        Text("\(car.carModel).")
                    }
                    .font(.callout)
                    .foregroundStyle(Color.white)
                    
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("rct"))
        .cornerRadius(16)
        .padding(.horizontal)
        
        .onAppear {
            vm.fetchUserData()
            vm.fetchData()
        }

    }
}

