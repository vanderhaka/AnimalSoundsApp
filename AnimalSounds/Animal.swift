import Foundation
import SwiftUI
import AVFoundation
import UIKit



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

struct AnimalCategory: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let background: String
    let animals: [Animal]
}


@main
struct AnimalSoundsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AudioPlayerDelegate: NSObject, AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            print("Finished playing audio")
        } else {
            print("Playback failed")
        }
    }
}



struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: effect)
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}

