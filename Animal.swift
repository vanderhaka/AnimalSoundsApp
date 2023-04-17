import Foundation

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let thumbnail: String
    let imageSoundMap: [String: String]
    let isPremium: Bool
}
