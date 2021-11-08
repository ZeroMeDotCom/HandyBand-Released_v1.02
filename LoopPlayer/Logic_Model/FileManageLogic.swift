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
                    "fileWay" : "track1_drum1.wav",
                   ],
        "track2" : ["isPause" : "true",
                    "fileWay" : "track2_drum2.wav",
                   ],
        "track3" : ["isPause" : "true",
                    "fileWay" : "track3_drum3.wav",
                   ],
        "track4" : ["isPause" : "true",
                    "fileWay" : "track4_bass1.wav",
                   ],
        "track5" : ["isPause" : "true",
                    "fileWay" : "track5_bass2.wav",
                   ],
        "track6" : ["isPause" : "true",
                    "fileWay" : "track6_bass3.wav",
                   ],
        "track7" : ["isPause" : "true",
                    "fileWay" : "track7_string1.wav",
                   ],
        "track8" : ["isPause" : "true",
                    "fileWay" : "track8_string2.wav",
                   ],
        "track9" : ["isPause" : "true",
                    "fileWay" : "track9_string3.wav",
                   ],
        "track10" : ["isPause" : "true",
                    "fileWay" : "track10_piano1.wav",
                   ],
        "track11" : ["isPause" : "true",
                    "fileWay" : "track11_piano2.wav",
                   ],
        "track12" : ["isPause" : "true",
                    "fileWay" : "track12_piano3.wav",
                   ],

    ]
    
    var BassNoteFileNames : [String : String] = [
        "C" : "bass_C3.mp3",
        "#C" : "bass_#C3.mp3",
        "D" : "bass_D3.mp3",
        "#D" : "bass_#D3.mp3",
        "E" : "bass_E3.mp3",
        "F" : "bass_F3.mp3",
        "#F" : "bass_#F3.mp3",
        "G" : "bass_G3.mp3",
        "#G" : "bass_#G3.mp3",
        "A" : "bass_A3.mp3",
        "#A" : "bass_#A3.mp3",
        "B" : "bass_B3.mp3",
    ]
    
    var StringNoteFileNames : [String : String] = [
        "C" : "BackgroundSound_C5.mp3",
        "#C" : "BackgroundSound_#C5.mp3",
        "D" : "BackgroundSound_D5.mp3",
        "#D" : "BackgroundSound_#D5.mp3",
        "E" : "BackgroundSound_E5.mp3",
        "F" : "BackgroundSound_F5.mp3",
        "#F" : "BackgroundSound_#F5.mp3",
        "G" : "BackgroundSound_G5.mp3",
        "#G" : "BackgroundSound_#G5.mp3",
        "A" : "BackgroundSound_A5.mp3",
        "#A" : "BackgroundSound_#A5.mp3",
        "B" : "BackgroundSound_B5.mp3",
    ]
    
    var PianoNoteFileNames : [String : String] = [
        "C" : "Piano_C3.mp3",
        "#C" : "Piano_#C3.mp3",
        "D" : "Piano_D3.mp3",
        "#D" : "Piano_#D3.mp3",
        "E" : "Piano_E3.mp3",
        "F" : "Piano_F3.mp3",
        "#F" : "Piano_#F3.mp3",
        "G" : "Piano_G3.mp3",
        "#G" : "Piano_#G3.mp3",
        "A" : "Piano_A3.mp3",
        "#A" : "Piano_#A3.mp3",
        "B" : "Piano_B3.mp3",
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
        //Notes Init C~B
        self.singleFileName_C = BassNoteFileNames["C"]!
        self.path_C = Bundle.main.path(forResource: singleFileName_C, ofType:nil)!
        self.url_C = URL(fileURLWithPath: path_C)
        
        self.singleFileName_PlusC = BassNoteFileNames["#C"]!
        self.path_PlusC = Bundle.main.path(forResource: singleFileName_PlusC, ofType:nil)!
        self.url_PlusC = URL(fileURLWithPath: path_PlusC)
        
        self.singleFileName_D = BassNoteFileNames["D"]!
        self.path_D = Bundle.main.path(forResource: singleFileName_D, ofType:nil)!
        self.url_D = URL(fileURLWithPath: path_D)
        
        self.singleFileName_PlusD = BassNoteFileNames["#D"]!
        self.path_PlusD = Bundle.main.path(forResource: singleFileName_PlusD, ofType:nil)!
        self.url_PlusD = URL(fileURLWithPath: path_PlusD)
        
        self.singleFileName_E = BassNoteFileNames["E"]!
        self.path_E = Bundle.main.path(forResource: singleFileName_E, ofType:nil)!
        self.url_E = URL(fileURLWithPath: path_E)
        
        self.singleFileName_F = BassNoteFileNames["F"]!
        self.path_F = Bundle.main.path(forResource: singleFileName_F, ofType:nil)!
        self.url_F = URL(fileURLWithPath: path_F)
        
        self.singleFileName_PlusF = BassNoteFileNames["#F"]!
        self.path_PlusF = Bundle.main.path(forResource: singleFileName_PlusF, ofType:nil)!
        self.url_PlusF = URL(fileURLWithPath: path_PlusF)
        
        self.singleFileName_G = BassNoteFileNames["G"]!
        self.path_G = Bundle.main.path(forResource: singleFileName_G, ofType:nil)!
        self.url_G = URL(fileURLWithPath: path_G)
        
        self.singleFileName_PlusG = BassNoteFileNames["#G"]!
        self.path_PlusG = Bundle.main.path(forResource: singleFileName_PlusG, ofType:nil)!
        self.url_PlusG = URL(fileURLWithPath: path_PlusG)
        
        self.singleFileName_A = BassNoteFileNames["A"]!
        self.path_A = Bundle.main.path(forResource: singleFileName_A, ofType:nil)!
        self.url_A = URL(fileURLWithPath: path_A)
        
        self.singleFileName_PlusA = BassNoteFileNames["#A"]!
        self.path_PlusA = Bundle.main.path(forResource: singleFileName_PlusA, ofType:nil)!
        self.url_PlusA = URL(fileURLWithPath: path_PlusA)
        
        self.singleFileName_B = BassNoteFileNames["B"]!
        self.path_B = Bundle.main.path(forResource: singleFileName_B, ofType:nil)!
        self.url_B = URL(fileURLWithPath: path_B)
        
        //Sample init
        self.singleFileName = "sample_drum_110_8_one.wav"
        self.path = Bundle.main.path(forResource: singleFileName, ofType:nil)!
        self.url = URL(fileURLWithPath: path)
        
        self.singleFileName2 = "sample_drum_110_8_one.wav"
        self.path2 = Bundle.main.path(forResource: singleFileName2, ofType:nil)!
        self.url2 = URL(fileURLWithPath: path2)
        
        self.singleFileName3 = "sample_drum_110_8_one.wav"
        self.path3 = Bundle.main.path(forResource: singleFileName3, ofType:nil)!
        self.url3 = URL(fileURLWithPath: path3)
        
//        self.singleFileName4 = fileNames[3]
//        self.path4 = Bundle.main.path(forResource: singleFileName4, ofType:nil)!
//        self.url4 = URL(fileURLWithPath: path4)
        
        engine.output = samplePlayer
        engine2.output = samplePlayer2
        engine3.output = samplePlayer3
//        engine4.output = samplePlayer4
        
        
        //Notes connect
        engine_C.output = samplePlayer_C
        engine_PlusC.output = samplePlayer_PlusC
        engine_D.output = samplePlayer_D
        engine_PlusD.output = samplePlayer_PlusD
        engine_E.output = samplePlayer_E
        engine_F.output = samplePlayer_F
        engine_PlusF.output = samplePlayer_PlusF
        engine_G.output = samplePlayer_G
        engine_PlusG.output = samplePlayer_PlusG
        engine_A.output = samplePlayer_A
        engine_PlusA.output = samplePlayer_PlusA
        engine_B.output = samplePlayer_B
    }
    
    
    func changeInstrumentToBass() {
        //Notes Init C~B
        self.singleFileName_C = BassNoteFileNames["C"]!
        self.path_C = Bundle.main.path(forResource: singleFileName_C, ofType:nil)!
        self.url_C = URL(fileURLWithPath: path_C)
        
        self.singleFileName_PlusC = BassNoteFileNames["#C"]!
        self.path_PlusC = Bundle.main.path(forResource: singleFileName_PlusC, ofType:nil)!
        self.url_PlusC = URL(fileURLWithPath: path_PlusC)
        
        self.singleFileName_D = BassNoteFileNames["D"]!
        self.path_D = Bundle.main.path(forResource: singleFileName_D, ofType:nil)!
        self.url_D = URL(fileURLWithPath: path_D)
        
        self.singleFileName_PlusD = BassNoteFileNames["#D"]!
        self.path_PlusD = Bundle.main.path(forResource: singleFileName_PlusD, ofType:nil)!
        self.url_PlusD = URL(fileURLWithPath: path_PlusD)
        
        self.singleFileName_E = BassNoteFileNames["E"]!
        self.path_E = Bundle.main.path(forResource: singleFileName_E, ofType:nil)!
        self.url_E = URL(fileURLWithPath: path_E)
        
        self.singleFileName_F = BassNoteFileNames["F"]!
        self.path_F = Bundle.main.path(forResource: singleFileName_F, ofType:nil)!
        self.url_F = URL(fileURLWithPath: path_F)
        
        self.singleFileName_PlusF = BassNoteFileNames["#F"]!
        self.path_PlusF = Bundle.main.path(forResource: singleFileName_PlusF, ofType:nil)!
        self.url_PlusF = URL(fileURLWithPath: path_PlusF)
        
        self.singleFileName_G = BassNoteFileNames["G"]!
        self.path_G = Bundle.main.path(forResource: singleFileName_G, ofType:nil)!
        self.url_G = URL(fileURLWithPath: path_G)
        
        self.singleFileName_PlusG = BassNoteFileNames["#G"]!
        self.path_PlusG = Bundle.main.path(forResource: singleFileName_PlusG, ofType:nil)!
        self.url_PlusG = URL(fileURLWithPath: path_PlusG)
        
        self.singleFileName_A = BassNoteFileNames["A"]!
        self.path_A = Bundle.main.path(forResource: singleFileName_A, ofType:nil)!
        self.url_A = URL(fileURLWithPath: path_A)
        
        self.singleFileName_PlusA = BassNoteFileNames["#A"]!
        self.path_PlusA = Bundle.main.path(forResource: singleFileName_PlusA, ofType:nil)!
        self.url_PlusA = URL(fileURLWithPath: path_PlusA)
        
        self.singleFileName_B = BassNoteFileNames["B"]!
        self.path_B = Bundle.main.path(forResource: singleFileName_B, ofType:nil)!
        self.url_B = URL(fileURLWithPath: path_B)
    }
    
    func changeInstrumentToString() {
        //Notes Init C~B
        self.singleFileName_C = StringNoteFileNames["C"]!
        self.path_C = Bundle.main.path(forResource: singleFileName_C, ofType:nil)!
        self.url_C = URL(fileURLWithPath: path_C)
        
        self.singleFileName_PlusC = StringNoteFileNames["#C"]!
        self.path_PlusC = Bundle.main.path(forResource: singleFileName_PlusC, ofType:nil)!
        self.url_PlusC = URL(fileURLWithPath: path_PlusC)
        
        self.singleFileName_D = StringNoteFileNames["D"]!
        self.path_D = Bundle.main.path(forResource: singleFileName_D, ofType:nil)!
        self.url_D = URL(fileURLWithPath: path_D)
        
        self.singleFileName_PlusD = StringNoteFileNames["#D"]!
        self.path_PlusD = Bundle.main.path(forResource: singleFileName_PlusD, ofType:nil)!
        self.url_PlusD = URL(fileURLWithPath: path_PlusD)
        
        self.singleFileName_E = StringNoteFileNames["E"]!
        self.path_E = Bundle.main.path(forResource: singleFileName_E, ofType:nil)!
        self.url_E = URL(fileURLWithPath: path_E)
        
        self.singleFileName_F = StringNoteFileNames["F"]!
        self.path_F = Bundle.main.path(forResource: singleFileName_F, ofType:nil)!
        self.url_F = URL(fileURLWithPath: path_F)
        
        self.singleFileName_PlusF = StringNoteFileNames["#F"]!
        self.path_PlusF = Bundle.main.path(forResource: singleFileName_PlusF, ofType:nil)!
        self.url_PlusF = URL(fileURLWithPath: path_PlusF)
        
        self.singleFileName_G = StringNoteFileNames["G"]!
        self.path_G = Bundle.main.path(forResource: singleFileName_G, ofType:nil)!
        self.url_G = URL(fileURLWithPath: path_G)
        
        self.singleFileName_PlusG = StringNoteFileNames["#G"]!
        self.path_PlusG = Bundle.main.path(forResource: singleFileName_PlusG, ofType:nil)!
        self.url_PlusG = URL(fileURLWithPath: path_PlusG)
        
        self.singleFileName_A = StringNoteFileNames["A"]!
        self.path_A = Bundle.main.path(forResource: singleFileName_A, ofType:nil)!
        self.url_A = URL(fileURLWithPath: path_A)
        
        self.singleFileName_PlusA = StringNoteFileNames["#A"]!
        self.path_PlusA = Bundle.main.path(forResource: singleFileName_PlusA, ofType:nil)!
        self.url_PlusA = URL(fileURLWithPath: path_PlusA)
        
        self.singleFileName_B = StringNoteFileNames["B"]!
        self.path_B = Bundle.main.path(forResource: singleFileName_B, ofType:nil)!
        self.url_B = URL(fileURLWithPath: path_B)
    }
    
    func changeInstrumentToPiano() {
        //Notes Init C~B
        self.singleFileName_C = PianoNoteFileNames["C"]!
        self.path_C = Bundle.main.path(forResource: singleFileName_C, ofType:nil)!
        self.url_C = URL(fileURLWithPath: path_C)
        
        self.singleFileName_PlusC = PianoNoteFileNames["#C"]!
        self.path_PlusC = Bundle.main.path(forResource: singleFileName_PlusC, ofType:nil)!
        self.url_PlusC = URL(fileURLWithPath: path_PlusC)
        
        self.singleFileName_D = PianoNoteFileNames["D"]!
        self.path_D = Bundle.main.path(forResource: singleFileName_D, ofType:nil)!
        self.url_D = URL(fileURLWithPath: path_D)
        
        self.singleFileName_PlusD = PianoNoteFileNames["#D"]!
        self.path_PlusD = Bundle.main.path(forResource: singleFileName_PlusD, ofType:nil)!
        self.url_PlusD = URL(fileURLWithPath: path_PlusD)
        
        self.singleFileName_E = PianoNoteFileNames["E"]!
        self.path_E = Bundle.main.path(forResource: singleFileName_E, ofType:nil)!
        self.url_E = URL(fileURLWithPath: path_E)
        
        self.singleFileName_F = PianoNoteFileNames["F"]!
        self.path_F = Bundle.main.path(forResource: singleFileName_F, ofType:nil)!
        self.url_F = URL(fileURLWithPath: path_F)
        
        self.singleFileName_PlusF = PianoNoteFileNames["#F"]!
        self.path_PlusF = Bundle.main.path(forResource: singleFileName_PlusF, ofType:nil)!
        self.url_PlusF = URL(fileURLWithPath: path_PlusF)
        
        self.singleFileName_G = PianoNoteFileNames["G"]!
        self.path_G = Bundle.main.path(forResource: singleFileName_G, ofType:nil)!
        self.url_G = URL(fileURLWithPath: path_G)
        
        self.singleFileName_PlusG = PianoNoteFileNames["#G"]!
        self.path_PlusG = Bundle.main.path(forResource: singleFileName_PlusG, ofType:nil)!
        self.url_PlusG = URL(fileURLWithPath: path_PlusG)
        
        self.singleFileName_A = PianoNoteFileNames["A"]!
        self.path_A = Bundle.main.path(forResource: singleFileName_A, ofType:nil)!
        self.url_A = URL(fileURLWithPath: path_A)
        
        self.singleFileName_PlusA = PianoNoteFileNames["#A"]!
        self.path_PlusA = Bundle.main.path(forResource: singleFileName_PlusA, ofType:nil)!
        self.url_PlusA = URL(fileURLWithPath: path_PlusA)
        
        self.singleFileName_B = PianoNoteFileNames["B"]!
        self.path_B = Bundle.main.path(forResource: singleFileName_B, ofType:nil)!
        self.url_B = URL(fileURLWithPath: path_B)
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


