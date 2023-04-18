import Foundation

struct Animal: Identifiable {
    let uuid: UUID
    let name: String
    let thumbnail: String
    let imageSoundMap: [String: String]
    let isPremium: Bool

    var id: UUID {
        return uuid
    }
}


