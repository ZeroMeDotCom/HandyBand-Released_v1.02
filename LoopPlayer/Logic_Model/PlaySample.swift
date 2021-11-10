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

class SamplePlyer : ObservableObject {
    let engine: AudioEngine
    var samplePlayer: AudioPlayer
    var isLooping : Bool
    var filename : String
    var url : URL
    var path : String
    var fileURL : String
    var volume : Double = 1
    
    //convolution
    var convolutionSalt_one : Convolution
    var convolutionSalt_two : Convolution
    var convolutionMixer : DryWetMixer
    var saltMixer : DryWetMixer
    var url_convolutionSalt_one : URL
    var url_convolutionSalt_two : URL
    
    //Reverb
    var reverb : Reverb
    var reverbMixer : DryWetMixer
    
    //Delay Setting
    var delay : Delay
    var dryWetMixer : DryWetMixer
    var delaySetting = DelaySetting()
    
    
    
    init(fileURL: String, filename: String, url: URL, path: String, engine: AudioEngine, samplePlayer: AudioPlayer, isLooping: Bool) {
        self.filename = "sample_drum_110_8_one.wav"
//        self.samplePlayer.isLooping = isLooping
        self.isLooping = isLooping
        self.path = Bundle.main.path(forResource: filename, ofType:nil)!
        self.url = URL(fileURLWithPath: path)
        self.fileURL = fileURL
        self.engine = engine
        self.samplePlayer = samplePlayer
        self.samplePlayer.isLooping = self.isLooping
        
        
        //Convolution
        //Path for convolution
        self.url_convolutionSalt_one = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        self.url_convolutionSalt_two = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one = Convolution(samplePlayer, impulseResponseFileURL: url_convolutionSalt_one, partitionLength: 8_192)
        convolutionSalt_two = Convolution(samplePlayer, impulseResponseFileURL: url_convolutionSalt_two, partitionLength: 8_192)
        
        //make a mixser
        saltMixer = DryWetMixer(convolutionSalt_one, convolutionSalt_two, balance: AUValue(0.5))
        convolutionMixer = DryWetMixer(samplePlayer, saltMixer, balance: AUValue(0.5))

        //Reverb
        reverb = Reverb(samplePlayer)
        reverb.dryWetMix = 100
        reverb.loadFactoryPreset(.cathedral)
        reverbMixer = DryWetMixer(convolutionMixer, reverb, balance: AUValue(0.5))
        
        
        //Delay Setting
        delay = Delay(samplePlayer)
        dryWetMixer = DryWetMixer(reverbMixer, delay, balance: AUValue(0.5)) //Using reverbMixers as input
        
        delay.time = delaySetting.time
        delay.feedback = delaySetting.feedback
        delay.dryWetMix = 100
        dryWetMixer.balance = delaySetting.balance
        

        engine.output = convolutionMixer
        samplePlayer.volume = AUValue(self.volume)
    }
    
    func change_reverb(place: String) {
        switch place {
        case "mediumChamber":
            reverb.loadFactoryPreset(.mediumChamber)
//            engine.output = reverb
        case "cathedral":
            reverb.loadFactoryPreset(.cathedral)
//            engine.output = reverb
        case "largeHall":
            reverb.loadFactoryPreset(.largeHall)
//            engine.output = reverb
        case "largeHall2":
            reverb.loadFactoryPreset(.largeHall2)
//            engine.output = reverb
        case "largeRoom":
            reverb.loadFactoryPreset(.largeRoom)
//            engine.output = reverb
        default:
            reverb.loadFactoryPreset(.mediumChamber)
//            engine.output = reverb
        }

    }
    
    func changeConvolution_balance(convolution_balance: AUValue){
        saltMixer.balance = convolution_balance
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
    
    //直接獲取URL版本播放
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        }
    func getFileURL(fileURL: String) -> URL {
        let path = getDocumentsDirectory().appendingPathComponent(fileURL)
        return path as URL
        }
    
    func play() {
        do {
            try engine.start()
        } catch {
            //
        }
        do {
//            try samplePlayer.load(url: getFileURL(fileURL: fileURL))
            print("單獨播放的文件:\(getFileURL(fileURL: fileURL))")
            try samplePlayer.load(url: url)
            //Delay Setting
            delay.feedback = 0.9
            delay.time = 0.1
            
            //convolution start
            convolutionSalt_one.start()
            convolutionSalt_two.start()
            
            samplePlayer.isLooping = true
            samplePlayer.play()
//            dryWetMixer.play()

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
