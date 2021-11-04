//
//  SoundCardPlugInLogic.swift
//  LoopPlayer
//
//  Created by Dan on 11/4/21.
//

import Foundation
import AudioKit
import AVFoundation

class SoundCardPlugInLogic: ObservableObject {
    var engine = AudioEngine()
    var inputSession: AudioEngine.InputNode?
    var soundSession: AVAudioOutputNode?
    
    init(){
        if let engineInput = engine.input {
            inputSession = engineInput
//            print("This is a demo有創建近來的")
            if let inputSignalData = inputSession {
//                print("This is a demo")
//                var soundOutput = inputSignalData
                engine.output = Mixer(inputSignalData)
            }
        } else {
            print("No data")
            inputSession = nil
            engine.output = Mixer()
        }
    }
    
    func openSession() {
        do {
            print("This is a demo - start")
            try engine.start()
        } catch {
            //
        }
    }
    
    func stopSession() {
        print("This is a demo - stop")
        engine.stop()
    }
}
