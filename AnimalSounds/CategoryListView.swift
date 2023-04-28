import SwiftUI

// Add the CategoryCard view
struct CategoryCard: View {
    let category: AnimalCategory

    var body: some View {
        VStack {
            Image(category.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 380, height: 250)
        }
        
    }
}

// Add animalCategories data
let animalCategories: [AnimalCategory] = [
    AnimalCategory(name: "Wild Animals", imageName: "wildtitle", animals: wildAnimals.animals),
    AnimalCategory(name: "Farm Animals", imageName: "farmtitle", animals: farmAnimals.animals),
    AnimalCategory(name: "Birds", imageName: "birdstitle", animals: birds.animals)
]

struct CategoryListView: View {
    @Binding var selectedCategory: AnimalCategory?

    var body: some View {
        ZStack {
            Image("cloudySky")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                ForEach(animalCategories) { category in
                    CategoryCard(category: category)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
            .padding(.top, 50)
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(selectedCategory: .constant(nil))
    }
}
