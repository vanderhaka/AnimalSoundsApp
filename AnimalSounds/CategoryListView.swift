import SwiftUI

// Add the CategoryCard view
struct CategoryCard: View {
    let category: AnimalCategory
    
    var body: some View {
        VStack {
            Text(category.name)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.gray)
        }
        .frame(width: 300, height: 200)
        .background(Color.white)
        .cornerRadius(20)
    }
}

// Add animalCategories data
let animalCategories: [AnimalCategory] = [
    AnimalCategory(name: "Farm Animals", animals: farmAnimals.animals),
    AnimalCategory(name: "Wild Animals", animals: wildAnimals.animals),
    AnimalCategory(name: "Birds", animals: birds.animals),
    AnimalCategory(name: "Ocean And River", animals: oceanAndRiver.animals)

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
