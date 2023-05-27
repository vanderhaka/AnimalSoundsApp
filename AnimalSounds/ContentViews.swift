import SwiftUI

struct ContentView: View {
    @State private var showPopup = false
    @State private var selectedAnimal: Animal? = nil
    @State private var selectedImageName = ""
    @State private var selectedCategory: AnimalCategory? = nil
    @State private var isSubscribed = false
    
    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { reader in
                Image("cloudySky")
                    .resizable()
                    .frame(width: reader.size.width, height: reader.size.height)
                    .clipped()
                
                if let category = selectedCategory {
                    AnimalGridView(
                        categories: [category],
                        isSubscribed: isSubscribed,
                        showPopup: $showPopup,
                        selectedAnimal: $selectedAnimal,
                        selectedImageName: $selectedImageName,
                        selectedCategory: $selectedCategory
                    )
                } else {
                    HStack {
                        Spacer()
                        CategoryListView(selectedCategory: $selectedCategory)
                        Spacer()
                    }
                }
                
                
                if showPopup, let animal = selectedAnimal {
                    PopupView(showPopup: $showPopup, animal: animal, imageName: selectedImageName, soundName: animal.imageSoundMap[selectedImageName]!, isSubscribed: isSubscribed)
                }
            }
        }.ignoresSafeArea()
            .onAppear {
                isSubscribed = UserDefaults.standard.bool(forKey: "activeSubscriptions")
            }.onReceive(NotificationCenter.default.publisher(for: Notification.Name("subscriptions"))) { output in
                let status = output.object as? Bool
                isSubscribed = status ?? false
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
