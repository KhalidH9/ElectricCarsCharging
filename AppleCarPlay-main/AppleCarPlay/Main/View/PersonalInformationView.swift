import SwiftUI

struct PersonalInformationView: View {
    
    @StateObject var vm = ViewModel()
    @State var validDriveLicense: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            
            Text("Personal Information")
                .font(.title2)
                .foregroundStyle(Color.white)
            
            ForEach(vm.user, id: \.id) { users in
                HStack{
                    VStack{
                        Text("Driver Name:")
                        Text("\(users.name)")
                    }
                    .font(.callout)
                    .foregroundStyle(Color.white)
                    
                    VStack{
                        Text("National ID:")
                        Text("\(users.NID)")
                    }
                    .font(.callout)
                    .foregroundStyle(Color.white)
                    
                    VStack{
                        Text("Driving License:")
                            .font(.callout)
                            .foregroundStyle(Color.white)
                        
                        Text(users.validDriveLicense ? "Valid" : "Not Valid")
                            .font(.callout)
                            .foregroundColor(users.validDriveLicense ? Color("green") : Color("yellow"))
                            .bold()
                    }
                    .font(.callout)
                    .foregroundStyle(Color.white)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color("rct"))
        .cornerRadius(16)
        .padding(.horizontal)
        
        .onAppear {
            vm.fetchUserData()
            vm.fetchData()
        }
    }
}
