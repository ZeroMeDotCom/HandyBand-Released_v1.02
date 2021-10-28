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


class SamplePlyer {
    
    var samplePlayer : AVAudioPlayer?
    var filename : String
    var url : URL
    var path : String
    var loopNumber : Int
    
    init(filename: String, loopNumber: Int){
        self.filename = filename
        self.loopNumber = loopNumber
        path = Bundle.main.path(forResource: filename, ofType:nil)!
        url = URL(fileURLWithPath: path)
    }
    
    func play() {
        do {
            samplePlayer = try AVAudioPlayer(contentsOf: url)
            samplePlayer?.numberOfLoops = loopNumber
        
            samplePlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func stop() {
        samplePlayer?.stop()
    }
}
