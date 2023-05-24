import SwiftUI

// Add the CategoryCard view
struct CategoryCard: View {
    let category: AnimalCategory

    var body: some View {
        VStack {
            Image(category.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        
    }
}

struct CategoryListView: View {
    @Binding var selectedCategory: AnimalCategory?
    
    // Add animalCategories data
    private let animalCategories: [AnimalCategory] = [
        wildAnimals, farmAnimals, birds
    ]

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
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
