import SwiftUI

struct AnimalGridView: View {
    let categories: [AnimalCategory]
    @Binding var showPopup: Bool
    @Binding var selectedAnimal: Animal?
    @Binding var selectedImageName: String
    @Binding var selectedCategory: AnimalCategory?
    @State private var showSubscriptionView = false

    
    private var columns: [GridItem] {
        let screenWidth = UIScreen.main.bounds.width
        let spacing: CGFloat = 20
        let minimumWidth: CGFloat = 120
        let maximumWidth: CGFloat = min(screenWidth / 2.5, 150)
        return [GridItem(.adaptive(minimum: minimumWidth, maximum: maximumWidth), spacing: spacing)]
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            
            Image(selectedCategory?.background ?? "")
                .resizable()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    let sortedAnimals = (selectedCategory?.animals ?? categories.flatMap { $0.animals }).sorted(by: { $0.isPremium && !$1.isPremium })
                    ForEach(sortedAnimals) { animal in
                        AnimalThumbnailView(
                            animal: animal,
                            action: {
                                if animal.isPremium {
                                    showSubscriptionView = true
                                } else {
                                    selectedAnimal = animal
                                    selectedImageName = animal.imageSoundMap.keys.randomElement()!
                                    showPopup = true
                                }
                            },
                            isPremium: animal.isPremium
                        )
                    }

                }
                .padding(.top, 80)  // start from 200px below the top of the screen
                .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
            }
            
            Button(action: {
                selectedCategory = nil
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 80, leading: 40, bottom: 0, trailing: 0))
        }
        .sheet(isPresented: $showSubscriptionView) {
            SubscriptionView()
        }

        .navigationBarHidden(true)
    }
}

struct AnimalThumbnailView: View {
    let animal: Animal
    let action: () -> Void
    let isPremium: Bool

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(animal.thumbnail) // Use the thumbnailImageName property here
                    .resizable()
                    .aspectRatio(contentMode: .fit) // use .fit to maintain the aspect ratio
                    .frame(minWidth: 100) // set a minimum width for the frame
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
        .padding(.top, 15) // Add padding around each thumbnail
    }
}
