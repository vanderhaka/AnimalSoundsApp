import SwiftUI
import AVFoundation

struct PopupView: View {
    @Binding var showPopup: Bool
    let animal: Animal
    let imageName: String
    let soundName: String
    @State private var audioPlayer: AVAudioPlayer?
    private let audioPlayerDelegate = AudioPlayerDelegate()

    var body: some View {
        ZStack {
            VStack {
                Text(animal.name)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.5)
                    .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 1)
            .cornerRadius(20)
            .padding()
            .background(Color.white.opacity(0.8))
            .onAppear {
                playSound(sound: soundName)
            }
        }
        .background(Color.clear.opacity(showPopup ? 1 : 0).ignoresSafeArea()) // Add this line to close the popup when tapping outside
        .onTapGesture {
            showPopup.toggle()
        }
    }

    func playSound(sound: String) {
        var url: URL? = Bundle.main.url(forResource: sound, withExtension: "mp3")
        if url == nil {
            url = Bundle.main.url(forResource: sound, withExtension: "wav")
        }
        guard let soundURL = url else {
            print("Error: Sound file not found")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.delegate = audioPlayerDelegate
            audioPlayer?.play()
        } catch let error {
            print("Error: Couldn't play the sound - \(error.localizedDescription)")
        }
    }
}
