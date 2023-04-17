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
                        AnimalThumbnailView(
                            animal: animal,
                            showPopup: $showPopup,
                            selectedAnimal: $selectedAnimal,
                            selectedImageName: $selectedImageName
                        )
                            .onTapGesture {
                                selectedAnimal = animal
                                selectedImageName = animal.imageSoundMap.keys.randomElement()!
                                showPopup = true
                            }
                    }
                }
                .padding(40)
            }
            .padding(.top, 50) // Add 100 pixels padding from the top
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
        .navigationBarHidden(true) // Hide the default navigation bar
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
