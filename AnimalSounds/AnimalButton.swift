import SwiftUI

struct AnimalButton: View {
    let animal: Animal
    @Binding var selectedAnimal: Animal?
    @Binding var selectedImageName: String
    @Binding var showPopup: Bool

    var body: some View {
        ZStack {
            Button(action: {
                if !animal.isPremium || hasAccessToPremiumContent() {
                    selectedAnimal = animal
                    let imageNames = Array(animal.imageSoundMap.keys)
                    let randomIndex = Int.random(in: 0..<imageNames.count)
                    selectedImageName = imageNames[randomIndex]
                    showPopup.toggle()
                }
            }) {
                Image(animal.thumbnail)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 1 / 2, height: UIScreen.main.bounds.width * 1 / 2)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 4)
            }
            .buttonStyle(PlainButtonStyle())
            .accessibilityLabel("Select \(animal.name)")
            .accessibilityHint("Double-tap to see more information and hear the sound of the \(animal.name).")
            .disabled(animal.isPremium && !hasAccessToPremiumContent())

            if animal.isPremium && !hasAccessToPremiumContent() {
                Image(systemName: "lock.fill")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .foregroundColor(.gray)
            }
        }
    }

    func hasAccessToPremiumContent() -> Bool {
        // Add your subscription check logic here.
        return false
    }
}
