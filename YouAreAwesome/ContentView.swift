//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by John Gallaugher on 10/18/26.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var soundIsOn = true
    @State private var audioPlayer: AVAudioPlayer?
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    let numberOfImages = 10
    let numberOfSounds = 6
    let messages = ["You Are Awesome!",
                    "When the Genius Bar Needs Help, They Call You!",
                    "You Are Great!",
                    "You Are Fantastic!",
                    "Fabulous? That's You!",
                    "You Make Me Smile!"]
    
    var body: some View {
        VStack {
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
                .animation(.default, value: message)
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                .animation(.default, value: imageName)
            
            Spacer()
            
            HStack {
                Text("Sound On:")
                Toggle("", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn) {
                        if !soundIsOn {
                            audioPlayer?.stop()
                        }
                    }
                Spacer()
                Button("Show Message") {
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                    message = messages[lastMessageNumber]
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"
                    if soundIsOn {
                        lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: numberOfSounds-1)
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                .font(.title2)
                .buttonStyle(.glassProminent)
            }
        }
        .padding()
    }
    
    func playSound(soundName: String) {
        audioPlayer?.stop()
        guard let soundDataAsset = NSDataAsset(name: soundName) else {
            print("😡 ERROR: Could not read file named: \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundDataAsset.data)
            audioPlayer?.play()
        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating AVAudioPlayer")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
}

#Preview {
    ContentView()
}
