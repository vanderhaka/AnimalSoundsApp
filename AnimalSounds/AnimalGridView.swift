import SwiftUI

struct AnimalGridView: View {
    let animals: [Animal]
    @Binding var showPopup: Bool
    @Binding var selectedAnimal: Animal?
    @Binding var selectedImageName: String
    @Binding var selectedCategory: AnimalCategory?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 30),
                    GridItem(.flexible(), spacing: 30),
                    GridItem(.flexible(), spacing: 30)
                ], spacing: 30) {
                    ForEach(animals) { animal in
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
                }
                .padding(40)
            }
            .padding(.top, 50)
            .background(
                Image("cloudySky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            )
            
            Button(action: {
                selectedCategory = nil
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
            }
            .padding(.top, 20)

        }
        .navigationBarHidden(true)
    }
    
    func hasAccessToPremiumContent() -> Bool {
        // Add your subscription check logic here.
        return false
    }
}

struct AnimalGridView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalGridView(
            animals: farmAnimals.animals,
            showPopup: .constant(false),
            selectedAnimal: .constant(nil),
            selectedImageName: .constant(""),
            selectedCategory: .constant(nil)
        )
    }
}
