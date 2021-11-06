//
//  FileManageLogic.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

//
//  FileManageLogic.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

import Foundation
import AudioKit

class FileManageLogic {
    var fileNames : [String] = ["sample_drum_110_8_one.wav", "sample_bass_110_8_two.wav", "sample_bass_110_8_three.wav"]

    
    var singleFileName: String
    var url : URL
    var path : String
    let engine = AudioEngine()
    var samplePlayer = AudioPlayer()
    
    var singleFileName2: String
    var url2 : URL
    var path2 : String
    let engine2 = AudioEngine()
    var samplePlayer2 = AudioPlayer()
    
    var singleFileName3: String
    var url3 : URL
    var path3 : String
    let engine3 = AudioEngine()
    var samplePlayer3 = AudioPlayer()
    

//    var singleFileName4: String
//    var url4 : URL
//    var path4 : String
//    let engine4 = AudioEngine()
//    var samplePlayer4 = AudioPlayer()


//    var url5 : URL
//    var url6 : URL
    
    
    init() {
        self.singleFileName = fileNames[0]
        self.path = Bundle.main.path(forResource: singleFileName, ofType:nil)!
        self.url = URL(fileURLWithPath: path)
        
        self.singleFileName2 = fileNames[1]
        self.path2 = Bundle.main.path(forResource: singleFileName2, ofType:nil)!
        self.url2 = URL(fileURLWithPath: path2)
        
        self.singleFileName3 = fileNames[2]
        self.path3 = Bundle.main.path(forResource: singleFileName3, ofType:nil)!
        self.url3 = URL(fileURLWithPath: path3)
        
//        self.singleFileName4 = fileNames[3]
//        self.path4 = Bundle.main.path(forResource: singleFileName4, ofType:nil)!
//        self.url4 = URL(fileURLWithPath: path4)
        
        engine.output = samplePlayer
        engine2.output = samplePlayer2
        engine3.output = samplePlayer3
//        engine4.output = samplePlayer4
    }
    
    func playSingle(url: URL, samplePlayer: AudioPlayer, engine: AudioEngine){
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
    
    func playResuting(){

        Timer.scheduledTimer(withTimeInterval: 60 / Double(110) * 8, repeats: true) { timer in
//            self.playSingle(url: self.url, samplePlayer: self.samplePlayer, engine: self.engine)
//
//            self.playSingle(url: self.url2, samplePlayer: self.samplePlayer2, engine: self.engine2)
//
//            self.playSingle(url: self.url3, samplePlayer: self.samplePlayer3, engine: self.engine3)
//
//            self.playSingle(url: self.url4, samplePlayer: self.samplePlayer4, engine: self.engine4)
            
        }

    }
    
    func reloding(){
        
    }
    
    func addingToPlayNextTime(){
        
    }
    

}


