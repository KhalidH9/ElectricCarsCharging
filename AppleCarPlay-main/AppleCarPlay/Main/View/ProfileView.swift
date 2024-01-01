import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        ScrollView{
            
            Text("Profile")
                .foregroundStyle(Color.white)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            UserProfileView()
            
            Spacer(minLength: 20)
            
            PersonalInformationView()
            
            UserCars()
            
        }
        .background(Color("bck"))
    }
}

#Preview {
    ProfileView()
}
