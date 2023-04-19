import SwiftUI

struct AnimalGridView: View {
    let categories: [AnimalCategory]
    @Binding var showPopup: Bool
    @Binding var selectedAnimal: Animal?
    @Binding var selectedImageName: String
    @Binding var selectedCategory: AnimalCategory?
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 120, maximum: 200), spacing: 30)]
    }
    
    func hasAccessToPremiumContent() -> Bool {
            // Replace this with the appropriate product identifiers
            let tier1ProductIdentifier = "ASFS2023"
            let tier2ProductIdentifier = "ASHS2023"

            return UserDefaults.standard.bool(forKey: tier1ProductIdentifier) ||
                   UserDefaults.standard.bool(forKey: tier2ProductIdentifier)
        }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 30) {
                    let sortedAnimals = (selectedCategory?.animals ?? categories.flatMap { $0.animals }).sorted(by: { $0.isPremium && !$1.isPremium })
                    ForEach(sortedAnimals) { animal in
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
}
