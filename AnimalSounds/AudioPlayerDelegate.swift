import AVFoundation

class AudioPlayerDelegate: NSObject, AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if flag {
            print("Finished playing audio")
        } else {
            print("Playback failed")
        }
    }
}
