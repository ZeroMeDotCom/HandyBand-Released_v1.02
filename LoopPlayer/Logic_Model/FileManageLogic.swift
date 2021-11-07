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

class FileManageLogic: ObservableObject {
    var fileNames : [String : [String : String]] = [
        "track1" : ["isPause" : "true",
                    "fileWay" : "sample_drum_110_8_one.wav",
                   ],
        "track2" : ["isPause" : "true",
                    "fileWay" : "sample_bass_110_8_two.wav",
                   ],
        "track3" : ["isPause" : "true",
                    "fileWay" : "sample_bass_110_8_three.wav",
                   ],
    ]
    
    //Notes
    //C
    var singleFileName_C: String
    var url_C : URL
    var path_C : String
    @Published var engine_C = AudioEngine()
    @Published var samplePlayer_C = AudioPlayer()
    
    //#C
    var singleFileName_PlusC: String
    var url_PlusC : URL
    var path_PlusC : String
    @Published var engine_PlusC = AudioEngine()
    @Published var samplePlayer_PlusC = AudioPlayer()
    
    //D
    var singleFileName_D: String
    var url_D : URL
    var path_D : String
    @Published var engine_D = AudioEngine()
    @Published var samplePlayer_D = AudioPlayer()
    
    //#D
    var singleFileName_PlusD: String
    var url_PlusD : URL
    var path_PlusD : String
    @Published var engine_PlusD = AudioEngine()
    @Published var samplePlayer_PlusD = AudioPlayer()
    
    //E
    var singleFileName_E: String
    var url_E : URL
    var path_E : String
    @Published var engine_E = AudioEngine()
    @Published var samplePlayer_E = AudioPlayer()
    
    //F
    var singleFileName_F: String
    var url_F : URL
    var path_F : String
    @Published var engine_F = AudioEngine()
    @Published var samplePlayer_F = AudioPlayer()
    
    //#F
    var singleFileName_PlusF: String
    var url_PlusF : URL
    var path_PlusF : String
    @Published var engine_PlusF = AudioEngine()
    @Published var samplePlayer_PlusF = AudioPlayer()
    
    //G
    var singleFileName_G: String
    var url_G : URL
    var path_G : String
    @Published var engine_G = AudioEngine()
    @Published var samplePlayer_G = AudioPlayer()
    
    //#G
    var singleFileName_PlusG: String
    var url_PlusG : URL
    var path_PlusG : String
    @Published var engine_PlusG = AudioEngine()
    @Published var samplePlayer_PlusG = AudioPlayer()
    
    //A
    var singleFileName_A: String
    var url_A : URL
    var path_A : String
    @Published var engine_A = AudioEngine()
    @Published var samplePlayer_A = AudioPlayer()
    
    //#A
    var singleFileName_PlusA: String
    var url_PlusA : URL
    var path_PlusA : String
    @Published var engine_PlusA = AudioEngine()
    @Published var samplePlayer_PlusA = AudioPlayer()
    
    
    //B
    var singleFileName_B: String
    var url_B : URL
    var path_B : String
    @Published var engine_B = AudioEngine()
    @Published var samplePlayer_B = AudioPlayer()
    
    //Samples
    @Published var isPause: Bool = true
    
    var singleFileName: String
    var url : URL
    var path : String
    @Published var engine = AudioEngine()
    @Published var samplePlayer = AudioPlayer()
    @Published var isWish: Bool = false
    
    var singleFileName2: String
    var url2 : URL
    var path2 : String
    @Published var engine2 = AudioEngine()
    @Published var samplePlayer2 = AudioPlayer()
    @Published var isWish2: Bool = false
    
    var singleFileName3: String
    var url3 : URL
    var path3 : String
    @Published var engine3 = AudioEngine()
    @Published var samplePlayer3 = AudioPlayer()
    @Published var isWish3: Bool = false
    

//    var singleFileName4: String
//    var url4 : URL
//    var path4 : String
//    let engine4 = AudioEngine()
//    var samplePlayer4 = AudioPlayer()


//    var url5 : URL
//    var url6 : URL
    
    
    init() {
        print("This is a demo")
        self.singleFileName = fileNames["track1"]!["fileWay"]!
        print(singleFileName)
        self.path = Bundle.main.path(forResource: singleFileName, ofType:nil)!
        self.url = URL(fileURLWithPath: path)
        
        self.singleFileName2 = fileNames["track2"]!["fileWay"]!
        self.path2 = Bundle.main.path(forResource: singleFileName2, ofType:nil)!
        self.url2 = URL(fileURLWithPath: path2)
        
        self.singleFileName3 = fileNames["track3"]!["fileWay"]!
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
        self.isPause = false
        Timer.scheduledTimer(withTimeInterval: 60 / Double(110) * 8, repeats: true) { timer in
            print("track1:\(self.isWish)")
            if self.isWish == true {
                print("play tack1....")
                self.playSingle(url: self.url, samplePlayer: self.samplePlayer, engine: self.engine)
            }
            if self.isWish2 == true {
                print("play tack2....")
                self.playSingle(url: self.url2, samplePlayer: self.samplePlayer2, engine: self.engine2)
            }
            if self.isWish3 == true {
                print("play tack2....")
                self.playSingle(url: self.url3, samplePlayer: self.samplePlayer3, engine: self.engine3)
            }

//            self.playSingle(url: self.url2, samplePlayer: self.samplePlayer2, engine: self.engine2)
//
//            self.playSingle(url: self.url3, samplePlayer: self.samplePlayer3, engine: self.engine3)
//
//            self.playSingle(url: self.url4, samplePlayer: self.samplePlayer4, engine: self.engine4)
            
            if self.isPause == true {
                timer.invalidate()
                self.pauseThepProcessing()
            }
            
        }

    }
    
    func pauseThepProcessing(){
        self.isPause = true
//        engine.stop()
//        engine2.stop()
//        engine3.stop()
        samplePlayer.stop()
        samplePlayer2.stop()
        samplePlayer3.stop()
    }
    
    func reloding(){
        
    }
    
    func addingToPlayNextTime(){
        
    }
    

}


