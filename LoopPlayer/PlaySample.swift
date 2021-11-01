//
//  PlaySample.swift
//  LoopPlayer
//
//  Created by Dan on 10/28/21.
//  What's this file for?
    // 1. filename, numbers of loop as input
    // 2. play sample from file
    // 3. change: reverb, delay(feedback/time/balance), sound volume

import Foundation
import AVFoundation
import AudioUnit
import AudioKit
import SoundpipeAudioKit

class SamplePlyer {
    let engine = AudioEngine()
    var samplePlayer = AudioPlayer()
    var filename : String
    var url : URL
    var path : String
    var volume : Double = 1
    
    //Reverb
    var reverb : Reverb
    
    //Delay Setting
    var delay : Delay
    var dryWetMixer : DryWetMixer
    var delaySetting = DelaySetting()
    
    
    
    init(filename: String, isLooping: Bool) {
        self.filename = filename
        self.samplePlayer.isLooping = isLooping
        path = Bundle.main.path(forResource: filename, ofType:nil)!
        url = URL(fileURLWithPath: path)
        
        //Reverb
        reverb = Reverb(samplePlayer)
        reverb.dryWetMix = 50
        reverb.loadFactoryPreset(.mediumHall2)
        
        
        //Delay Setting
        delay = Delay(samplePlayer)
        dryWetMixer = DryWetMixer(samplePlayer, delay)
        
        delay.time = delaySetting.time
        delay.feedback = delaySetting.feedback
        delay.dryWetMix = 100
        dryWetMixer.balance = delaySetting.balance
        

        engine.output = dryWetMixer
        samplePlayer.volume = AUValue(self.volume)
    }
    
    func change_reverb(place: String) {
        switch place {
        case "mediumChamber":
            print("mediumChamber")
            reverb.loadFactoryPreset(.mediumChamber)
            engine.output = reverb
        case "cathedral":
            reverb.loadFactoryPreset(.cathedral)
            engine.output = reverb
        case "largeHall":
            reverb.loadFactoryPreset(.largeHall)
            engine.output = reverb
        case "largeHall2":
            reverb.loadFactoryPreset(.largeHall2)
            engine.output = reverb
        case "largeRoom":
            reverb.loadFactoryPreset(.largeRoom)
            engine.output = reverb
        default:
            reverb.loadFactoryPreset(.mediumChamber)
            engine.output = reverb
        }

    }

    func changeDelay_balance(delay_balance: Double) {
        dryWetMixer.balance = AUValue(delay_balance)
    }
    
    func changeDelay_feedback(delay_feedback: Double) {
        delay.feedback = AUValue(delay_feedback)
    }
    
    func changeDelay_time(delay_time: Double) {
        delay.time = AUValue(delay_time)
    }
    
    func changeVolume(value: Double) {
        samplePlayer.volume = AUValue(value)
    }
    
    func play() {
        do {
            try engine.start()
        } catch {
            //
        }
        do {
            try samplePlayer.load(url: url)
            //Delay Setting
            delay.feedback = 0.9
            delay.time = 0.01
            samplePlayer.play()

        } catch {
            // couldn't load file :(
        }
        
    }

    func stop() {
        engine.stop()
    }
}



//Basic Version One
//class SamplePlyer {
//
//    var samplePlayer : AVAudioPlayer?
//    var filename : String
//    var url : URL
//    var path : String
//    var loopNumber : Int
//
//    init(filename: String, loopNumber: Int){
//        self.filename = filename
//        self.loopNumber = loopNumber
//        path = Bundle.main.path(forResource: filename, ofType:nil)!
//        url = URL(fileURLWithPath: path)
//    }
//
//    func play() {
//        do {
//            samplePlayer = try AVAudioPlayer(contentsOf: url)
//            samplePlayer?.numberOfLoops = loopNumber
//
//            samplePlayer?.play()
//        } catch {
//            // couldn't load file :(
//        }
//    }
//
//    func stop() {
//        samplePlayer?.stop()
//    }
//}
