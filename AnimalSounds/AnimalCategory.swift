import Foundation

struct AnimalCategory: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let animals: [Animal]
}
