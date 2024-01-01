import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var viewModel: ImageViewModel
    let imageURL: String
    
    init(imageURL: String) {
        self.viewModel = ImageViewModel()
        self.imageURL = imageURL
        self.viewModel.loadImage(from: imageURL)
    }
    
    var body: some View {
        if let data = viewModel.imageData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
    }
}
