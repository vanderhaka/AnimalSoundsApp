import SwiftUI
import StoreKit
import AVFoundation

struct PopupView: View {
    @Binding var showPopup: Bool
    let animal: Animal
    let imageName: String
    let soundName: String
    let isSubscribed: Bool
    @State private var showSubscriptionView = false
    @State private var audioPlayer: AVAudioPlayer?
    private let audioPlayerDelegate = AudioPlayerDelegate()

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 0.5)
                    .padding()
                
                Text(animal.name)
                    .font(.system(size: 50))
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.bottom)

                

                Button(action: {
                    if animal.isPremium && !isSubscribed {
                        showSubscriptionView = true
                    } else {
                        playSound(sound: soundName)
                    }
                }) {
                    Text((animal.isPremium && !isSubscribed) ? "Unlock Premium Sound" : "Play Sound")
                        .font(.title)
                        .bold()
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .opacity((animal.isPremium && !isSubscribed) ? 1 : 0)
                .padding(.bottom)
            }
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height * 1)
            .cornerRadius(20)
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(20)
            .shadow(radius: 20)
            .onAppear {
                if !animal.isPremium || isSubscribed {
                    playSound(sound: soundName)
                }
            }

            .contentShape(Rectangle())
            .onTapGesture {
                showPopup = false
            }
            .sheet(isPresented: $showSubscriptionView) {
                SubscriptionView()
            }

        }
        .background(Color.clear.opacity(showPopup ? 1 : 0).ignoresSafeArea())
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
