import SwiftUI

struct AnimalThumbnailView: View {
    let animal: Animal
    let action: () -> Void
    let isPremium: Bool

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(animal.thumbnail) // Use the thumbnailImageName property here
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 4)
                    )

                if isPremium {
                    Image("premium")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .padding(EdgeInsets(top: -12, leading: 0, bottom: 0, trailing: -15))
                }
            }
            Text(animal.name)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
        }
        .onTapGesture(perform: action)
    }
}
