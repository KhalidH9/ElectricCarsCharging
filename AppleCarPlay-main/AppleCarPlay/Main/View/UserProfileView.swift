import SwiftUI

struct UserProfileView: View {
    
    @StateObject var vm = ViewModel()
    @State var validDriveLicense: Bool = false
    
    var body: some View {
        VStack{
            ForEach(vm.user, id: \.id) { users in
                RemoteImageView(imageURL: "https://source.unsplash.com/random/90x90?man")
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                
                Text("\(users.name)")
                    .font(.title2)
                    .foregroundStyle(Color.white)
            }
        }
        
        .onAppear {
            vm.fetchUserData()
            vm.fetchData()
        }
        
    }
}
