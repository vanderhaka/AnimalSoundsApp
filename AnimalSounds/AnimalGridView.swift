import SwiftUI

struct AnimalGridView: View {
    let animals: [Animal]
    @Binding var showPopup: Bool
    @Binding var selectedAnimal: Animal?
    @Binding var selectedImageName: String
    @Binding var selectedCategory: AnimalCategory?
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 30)]
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(animals) { animal in
                        AnimalThumbnailView(
                            animal: animal,
                            action: {
                                selectedAnimal = animal
                                selectedImageName = animal.imageSoundMap.keys.randomElement()!
                                showPopup = true
                            }
                        )
                    }
                }
                .padding(EdgeInsets(top: 60, leading: 40, bottom: 40, trailing: 40))
            }
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
            .padding(.top, 10)
        }
        .navigationBarHidden(true)
        .padding(.top, 60)
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
