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
            Image("cloudySky")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)

            GeometryReader { reader in
                
                let itemHeight = (reader.size.height - 100) / 3
                VStack(spacing: 0) {
                    ForEach(animalCategories) { category in
                        CategoryCard(category: category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                            .frame(maxWidth: .infinity, maxHeight: itemHeight)
                    }
                }
                .padding(.vertical, 50)
            }
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(selectedCategory: .constant(nil))
    }
}
