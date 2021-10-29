//
//  PlaySample.swift
//  LoopPlayer
//
//  Created by Dan on 10/28/21.
//  What's this file for?
    // 1. filename, numbers of loop as input
    // 2. play sample from file

import Foundation
import AVFoundation
import AudioUnit
import AudioKit

class SamplePlyer {
    let engine = AudioEngine()
    var samplePlayer = AudioPlayer()
    var filename : String
    var url : URL
    var path : String
    var volume : Double = 1
    
    init(filename: String, isLooping: Bool) {
        self.filename = filename
        self.samplePlayer.isLooping = isLooping
        path = Bundle.main.path(forResource: filename, ofType:nil)!
        url = URL(fileURLWithPath: path)
        engine.output = samplePlayer
        samplePlayer.volume = AUValue(self.volume)
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
