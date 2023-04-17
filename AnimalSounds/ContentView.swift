import SwiftUI

struct ContentView: View {
    @State private var showPopup = false
    @State private var selectedAnimal: Animal? = nil
    @State private var selectedImageName = ""
    @State private var selectedCategory: AnimalCategory? = nil
    
    var body: some View {
        ZStack {
            Image("cloudySky")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            if let category = selectedCategory {
                AnimalGridView(animals: category.animals, showPopup: $showPopup, selectedAnimal: $selectedAnimal, selectedImageName: $selectedImageName, selectedCategory: $selectedCategory)
            } else {
                CategoryListView(selectedCategory: $selectedCategory)
            }
            
            if showPopup, let animal = selectedAnimal {
                PopupView(showPopup: $showPopup, animal: animal, imageName: selectedImageName, soundName: animal.imageSoundMap[selectedImageName]!)
            }
        }
    }
}
