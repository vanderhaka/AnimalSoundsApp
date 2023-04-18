import SwiftUI
import StoreKit
import AVFoundation

struct PopupView: View {
    @Binding var showPopup: Bool
    let animal: Animal
    let imageName: String
    let soundName: String
    @State private var showSubscriptionView = false
    @State private var audioPlayer: AVAudioPlayer?
    private let audioPlayerDelegate = AudioPlayerDelegate()

    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    showPopup = false
                }
            
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                
                Button(action: {
                    if animal.isPremium {
                        showSubscriptionView.toggle()
                    } else {
                        playSound(sound: soundName)
                    }
                }) {
                    Text(animal.isPremium ? "Unlock Premium Sound" : "Play Sound")
                        .font(.title)
                        .bold()
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .frame(width: 300, height: 300)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 20)
            
            if showSubscriptionView {
                SubscriptionView(isPresented: $showSubscriptionView)

            }
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
