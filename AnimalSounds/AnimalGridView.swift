import SwiftUI

struct AnimalGridView: View {
    let categories: [AnimalCategory]
    @Binding var showPopup: Bool
    @Binding var selectedAnimal: Animal?
    @Binding var selectedImageName: String
    @Binding var selectedCategory: AnimalCategory?
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 90, maximum: 200), spacing: 30)]
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    ForEach(selectedCategory?.animals ?? categories.flatMap { $0.animals }) { animal in
                        AnimalThumbnailView(
                            animal: animal,
                            action: {
                                selectedAnimal = animal
                                selectedImageName = animal.imageSoundMap.keys.randomElement()!
                                showPopup = true
                            },
                            isPremium: animal.isPremium
                        )
                    }
                }
                .padding(.top, 50)
                .padding(EdgeInsets(top: 60, leading: 40, bottom: 40, trailing: 40))
            }
            .background(
                Group {
                    if selectedCategory?.name == "Wild Animals" {
                        Image("wildAnimalsBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else if selectedCategory?.name == "Farm Animals" {
                        Image("farmAnimalsBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } else {
                        Image("cloudySky")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                .frame(height: UIScreen.main.bounds.height)
            )
            
            Button(action: {
                selectedCategory = nil
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 30, leading: 40, bottom: 0, trailing: 0))
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
            categories: [farmAnimals, wildAnimals],
            showPopup: .constant(false),
            selectedAnimal: .constant(nil),
            selectedImageName: .constant(""),
            selectedCategory: .constant(nil)
        )
    }
}
