import SwiftUI

struct AnimalThumbnailView: View {
    let animal: Animal
    @Binding var showPopup: Bool
    @Binding var selectedAnimal: Animal?
    @Binding var selectedImageName: String
    
    var body: some View {
        VStack {
            Image(animal.thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(20)
                .shadow(radius: 10)
        }
    }
}

struct AnimalThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalThumbnailView(
            animal: farmAnimals.animals.first!,
            showPopup: .constant(false),
            selectedAnimal: .constant(nil),
            selectedImageName: .constant("")
        )
    }
}
    