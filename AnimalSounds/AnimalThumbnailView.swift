import SwiftUI

struct AnimalThumbnailView: View {
    let animal: Animal
    let action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                Image(animal.thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
                    .shadow(radius: 10)
            }
        }
    }
}

struct AnimalThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalThumbnailView(
            animal: farmAnimals.animals.first!,
            action: {}
        )
    }
}
