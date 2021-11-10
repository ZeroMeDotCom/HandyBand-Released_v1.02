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
import AudioUnit
import AudioKit
import SoundpipeAudioKit

class FileManageLogic: ObservableObject {
    var savedFileNames = SavedFileNames()
//    var fileURL : String
    @Published var whichToPlay: [Bool] = [true, false, false, false, false, false, false, false, false, false, false, false, false, true]
    private var trackID : String = ""
//    var geSystemPathWay = GetSystemPathWay()
    //需要刪除優化？
    var fileNames : [String : [String : String]] = [
        "track1" : ["isPause" : "true",
                    "fileWay" : "track1_drum1.m4a",
                   ],
        "track2" : ["isPause" : "true",
                    "fileWay" : "track2_drum2.m4a",
                   ],
        "track3" : ["isPause" : "true",
                    "fileWay" : "track3_drum3.m4a",
                   ],
        "track4" : ["isPause" : "true",
                    "fileWay" : "track4_bass1.m4a",
                   ],
        "track5" : ["isPause" : "true",
                    "fileWay" : "track5_bass2.m4a",
                   ],
        "track6" : ["isPause" : "true",
                    "fileWay" : "track6_bass3.m4a",
                   ],
        "track7" : ["isPause" : "true",
                    "fileWay" : "track7_string1.m4a",
                   ],
        "track8" : ["isPause" : "true",
                    "fileWay" : "track8_string2.m4a",
                   ],
        "track9" : ["isPause" : "true",
                    "fileWay" : "track9_string3.m4a",
                   ],
        "track10" : ["isPause" : "true",
                    "fileWay" : "track10_piano1.m4a",
                   ],
        "track11" : ["isPause" : "true",
                    "fileWay" : "track11_piano2.m4a",
                   ],
        "track12" : ["isPause" : "true",
                    "fileWay" : "track12_piano3.m4a",
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
    //The tracks
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
    
    var singleFileName4: String
    var url4 : URL
    var path4 : String
    @Published var engine4 = AudioEngine()
    @Published var samplePlayer4 = AudioPlayer()
    @Published var isWish4: Bool = false
    
    var singleFileName5: String
    var url5 : URL
    var path5 : String
    @Published var engine5 = AudioEngine()
    @Published var samplePlayer5 = AudioPlayer()
    @Published var isWish5: Bool = false
    
    var singleFileName6: String
    var url6 : URL
    var path6 : String
    @Published var engine6 = AudioEngine()
    @Published var samplePlayer6 = AudioPlayer()
    @Published var isWish6: Bool = false
    
    var singleFileName7: String
    var url7 : URL
    var path7 : String
    @Published var engine7 = AudioEngine()
    @Published var samplePlayer7 = AudioPlayer()
    @Published var isWish7: Bool = false
    
    var singleFileName8: String
    var url8 : URL
    var path8 : String
    @Published var engine8 = AudioEngine()
    @Published var samplePlayer8 = AudioPlayer()
    @Published var isWish8: Bool = false
    
    var singleFileName9: String
    var url9 : URL
    var path9 : String
    @Published var engine9 = AudioEngine()
    @Published var samplePlayer9 = AudioPlayer()
    @Published var isWish9: Bool = false
    
    var singleFileName10: String
    var url10 : URL
    var path10 : String
    @Published var engine10 = AudioEngine()
    @Published var samplePlayer10 = AudioPlayer()
    @Published var isWish10: Bool = false
    
    var singleFileName11: String
    var url11 : URL
    var path11 : String
    @Published var engine11 = AudioEngine()
    @Published var samplePlayer11 = AudioPlayer()
    @Published var isWish11: Bool = false
    
    var singleFileName12: String
    var url12 : URL
    var path12 : String
    @Published var engine12 = AudioEngine()
    @Published var samplePlayer12 = AudioPlayer()
    @Published var isWish12: Bool = false
    
    //Delay Setting
    var delay : Delay
    var dryWetMixer : DryWetMixer
    var delaySetting = DelaySetting()
    var engine777 = AudioEngine()
    var samplePlayer777 = AudioPlayer()
    
    //Reverb
    var reverb : Reverb
    var reverbMixer : DryWetMixer
    

    
    init() {
        //Delay
        delay = Delay(samplePlayer777)
        dryWetMixer = DryWetMixer(samplePlayer777, delay, balance: AUValue(0.5)) //Using reverbMixers as input
        delay.time = delaySetting.time
        delay.feedback = delaySetting.feedback
        delay.dryWetMix = 100
        dryWetMixer.balance = delaySetting.balance
        
        //Reverb
        reverb = Reverb(dryWetMixer)
        reverb.dryWetMix = 100
        reverb.loadFactoryPreset(.cathedral)
        reverbMixer = DryWetMixer(dryWetMixer, reverb, balance: AUValue(0.5))
        engine777.output = reverbMixer
        
        
        
        
        
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
        
        self.singleFileName4 = "sample_drum_110_8_one.wav"
        self.path4 = Bundle.main.path(forResource: singleFileName4, ofType:nil)!
        self.url4 = URL(fileURLWithPath: path4)
        
        self.singleFileName5 = "sample_drum_110_8_one.wav"
        self.path5 = Bundle.main.path(forResource: singleFileName5, ofType:nil)!
        self.url5 = URL(fileURLWithPath: path5)
        
        self.singleFileName6 = "sample_drum_110_8_one.wav"
        self.path6 = Bundle.main.path(forResource: singleFileName6, ofType:nil)!
        self.url6 = URL(fileURLWithPath: path6)
        
        self.singleFileName7 = "sample_drum_110_8_one.wav"
        self.path7 = Bundle.main.path(forResource: singleFileName7, ofType:nil)!
        self.url7 = URL(fileURLWithPath: path7)
        
        self.singleFileName8 = "sample_drum_110_8_one.wav"
        self.path8 = Bundle.main.path(forResource: singleFileName8, ofType:nil)!
        self.url8 = URL(fileURLWithPath: path8)
        
        self.singleFileName9 = "sample_drum_110_8_one.wav"
        self.path9 = Bundle.main.path(forResource: singleFileName9, ofType:nil)!
        self.url9 = URL(fileURLWithPath: path9)
        
        self.singleFileName10 = "sample_drum_110_8_one.wav"
        self.path10 = Bundle.main.path(forResource: singleFileName10, ofType:nil)!
        self.url10 = URL(fileURLWithPath: path10)
        
        self.singleFileName11 = "sample_drum_110_8_one.wav"
        self.path11 = Bundle.main.path(forResource: singleFileName11, ofType:nil)!
        self.url11 = URL(fileURLWithPath: path11)
        
        self.singleFileName12 = "sample_drum_110_8_one.wav"
        self.path12 = Bundle.main.path(forResource: singleFileName12, ofType:nil)!
        self.url12 = URL(fileURLWithPath: path12)
        
//        engine.output = samplePlayer
//        engine2.output = samplePlayer2
//        engine3.output = samplePlayer3
//        engine4.output = samplePlayer4
//        engine5.output = samplePlayer5
//        engine6.output = samplePlayer6
//        engine7.output = samplePlayer7
//        engine8.output = samplePlayer8
//        engine9.output = samplePlayer9
//        engine10.output = samplePlayer10
//        engine11.output = samplePlayer11
//        engine12.output = samplePlayer12
        
        
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
    
    //直接獲取URL版本播放
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        }
    
    func getFileURL(fileURL: String) -> URL {
        let path = getDocumentsDirectory().appendingPathComponent(fileURL)
        return path as URL
        }
    
    func playSingle(url: URL, samplePlayer: AudioPlayer, engine: AudioEngine){
        do {
            try engine.start()
        } catch {
            print(error)
        }
        do {
            try samplePlayer.load(url: url)
            samplePlayer.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    func playSingleTrack(fileURL: String, samplePlayer: AudioPlayer, engine: AudioEngine){
        do {
            try engine.start()
            
        } catch {
            print("引擎失敗")
            //
        }
        do {
            print("單獨播放的文件:\(getFileURL(fileURL: fileURL))")
            try samplePlayer.load(url: getFileURL(fileURL: fileURL))

//            samplePlayer.isLooping = true
            samplePlayer.play()

        } catch {
            // couldn't load file :(
            print("播放器失敗")
        }
    }
    
    func playResuting(){
        self.isPause = false
//        playSingle(url: url_D, samplePlayer: samplePlayer_D, engine: engine_D)
        playSingleTrack(fileURL: fileNames["track1"]!["fileWay"]!, samplePlayer: self.samplePlayer, engine: self.engine)
//        for i in 1..<13 {
//            print("第\(i)次掃描")
////            if self.whichToPlay[i] {
////                self.playSingle(fileURL: fileNames["track\(i)"]!["fileWay"]!, samplePlayer: self.samplePlayer, engine: self.engine)
////            }
//            if self.whichToPlay[i] && i == 1 {
//                self.playSingleTrack(fileURL: fileNames["track1"]!["fileWay"]!, samplePlayer: self.samplePlayer, engine: self.engine)
//            } else if i == 2 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track2"]!["fileWay"]!, samplePlayer: self.samplePlayer2, engine: self.engine2)
//            } else if i == 3 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track3"]!["fileWay"]!, samplePlayer: self.samplePlayer3, engine: self.engine3)
//            } else if i == 4 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track4"]!["fileWay"]!, samplePlayer: self.samplePlayer4, engine: self.engine4)
//            } else if i == 5 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track5"]!["fileWay"]!, samplePlayer: self.samplePlayer5, engine: self.engine5)
//            } else if i == 6 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track6"]!["fileWay"]!, samplePlayer: self.samplePlayer6, engine: self.engine6)
//            } else if i == 7 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track7"]!["fileWay"]!, samplePlayer: self.samplePlayer7, engine: self.engine7)
//            } else if i == 8 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track8"]!["fileWay"]!, samplePlayer: self.samplePlayer8, engine: self.engine8)
//            } else if i == 9 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track9"]!["fileWay"]!, samplePlayer: self.samplePlayer9, engine: self.engine9)
//            } else if i == 10 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track10"]!["fileWay"]!, samplePlayer: self.samplePlayer10, engine: self.engine10)
//            } else if i == 11 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track11"]!["fileWay"]!, samplePlayer: self.samplePlayer11, engine: self.engine11)
//            } else if i == 12 && self.whichToPlay[i] {
//                self.playSingleTrack(fileURL: fileNames["track12"]!["fileWay"]!, samplePlayer: self.samplePlayer12, engine: self.engine12)
//            }
//        }
        
//        Timer.scheduledTimer(withTimeInterval: 60 / Double(110) * 8, repeats: true) { timer in
//            print("track1:\(self.isWish)")
//            if self.isWish == true {
//                print("play tack1....")
//                self.playSingle(url: self.url, samplePlayer: self.samplePlayer, engine: self.engine)
//            }
//            if self.isWish2 == true {
//                print("play tack2....")
//                self.playSingle(url: self.url2, samplePlayer: self.samplePlayer2, engine: self.engine2)
//            }
//            if self.isWish3 == true {
//                print("play tack2....")
//                self.playSingle(url: self.url3, samplePlayer: self.samplePlayer3, engine: self.engine3)
//            }

//            self.playSingle(url: self.url2, samplePlayer: self.samplePlayer2, engine: self.engine2)
//
//            self.playSingle(url: self.url3, samplePlayer: self.samplePlayer3, engine: self.engine3)
//
//            self.playSingle(url: self.url4, samplePlayer: self.samplePlayer4, engine: self.engine4)
        
//            if self.isPause == true {
//    //                timer.invalidate()
//                self.pauseThepProcessing()
//            }
//        }
//
//        if self.isPause == true {
//            self.pauseThepProcessing()
//        }

    }
    
    //Stop play
    func pauseThepProcessing(){
        self.isPause = true
        engine.stop()
        engine2.stop()
        engine3.stop()
        engine4.stop()
        engine5.stop()
        engine6.stop()
        engine7.stop()
        engine8.stop()
        engine9.stop()
        engine10.stop()
        engine11.stop()
        engine12.stop()
        
        samplePlayer.stop()
        samplePlayer2.stop()
        samplePlayer3.stop()
        samplePlayer4.stop()
        samplePlayer5.stop()
        samplePlayer6.stop()
        samplePlayer7.stop()
        samplePlayer8.stop()
        samplePlayer9.stop()
        samplePlayer10.stop()
        samplePlayer11.stop()
        samplePlayer12.stop()
        
    }
    
    func setToEdit(trackID: String) {
        self.trackID = trackID
        switch self.trackID {
        case "track1":
            whichToPlay[1] = false
//            return whichToPlay[1]
        case "track2":
            whichToPlay[2] = false
//            return whichToPlay[2]
        case "track3":
            whichToPlay[3] = false
//            return whichToPlay[3]
        case "track4":
            whichToPlay[4] = false
//            return whichToPlay[4]
        case "track5":
            whichToPlay[5] = false
//            return whichToPlay[5]
        case "track6":
            whichToPlay[6] = false
//            return whichToPlay[6]
        case "track7":
            whichToPlay[7] = false
//            return whichToPlay[7]
        case "track8":
            whichToPlay[8] = false
//            return whichToPlay[8]
        case "track9":
            whichToPlay[9] = false
//            return whichToPlay[9]
        case "track10":
            whichToPlay[10] = false
//            return whichToPlay[10]
        case "track11":
            whichToPlay[11] = false
//            return whichToPlay[11]
        case "track12":
            whichToPlay[12] = false
//            return whichToPlay[12]
        default:
            whichToPlay[13] = false
//            return whichToPlay[13]
        }
    }
    
    func setReady(trackID: String) {
        self.trackID = trackID
        switch self.trackID {
        case "track1":
            whichToPlay[1] = true
//            return whichToPlay[1]
        case "track2":
            whichToPlay[2] = true
//            return whichToPlay[2]
        case "track3":
            whichToPlay[3] = true
//            return whichToPlay[3]
        case "track4":
            whichToPlay[4] = true
//            return whichToPlay[4]
        case "track5":
            whichToPlay[5] = true
//            return whichToPlay[5]
        case "track6":
            whichToPlay[6] = true
//            return whichToPlay[6]
        case "track7":
            whichToPlay[7] = true
//            return whichToPlay[7]
        case "track8":
            whichToPlay[8] = true
//            return whichToPlay[8]
        case "track9":
            whichToPlay[9] = true
//            return whichToPlay[9]
        case "track10":
            whichToPlay[10] = true
//            return whichToPlay[10]
        case "track11":
            whichToPlay[11] = true
//            return whichToPlay[11]
        case "track12":
            whichToPlay[12] = true
//            return whichToPlay[12]
        default:
            whichToPlay[13] = false
//            return whichToPlay[13]
        }
    }
    
    func reloding(){
        
    }
    
    func addingToPlayNextTime(trackID: String) -> Bool {
        self.trackID = trackID
        switch self.trackID {
        case "track1":
//            whichToPlay[1] = true
            return whichToPlay[1]
        case "track2":
//            whichToPlay[2] = true
            return whichToPlay[2]
        case "track3":
//            whichToPlay[3] = true
            return whichToPlay[3]
        case "track4":
//            whichToPlay[4] = true
            return whichToPlay[4]
        case "track5":
//            whichToPlay[5] = true
            return whichToPlay[5]
        case "track6":
//            whichToPlay[6] = true
            return whichToPlay[6]
        case "track7":
//            whichToPlay[7] = true
            return whichToPlay[7]
        case "track8":
//            whichToPlay[8] = true
            return whichToPlay[8]
        case "track9":
//            whichToPlay[9] = true
            return whichToPlay[9]
        case "track10":
//            whichToPlay[10] = true
            return whichToPlay[10]
        case "track11":
//            whichToPlay[11] = true
            return whichToPlay[11]
        case "track12":
//            whichToPlay[12] = true
            return whichToPlay[12]
        default:
//            whichToPlay[13] = false
            return whichToPlay[13]
        }
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

    func changeDelay_balance(delay_balance: Double) {
        dryWetMixer.balance = AUValue(delay_balance)
    }
    
    func changeDelay_feedback(delay_feedback: Double) {
        delay.feedback = AUValue(delay_feedback)
    }
    
    func changeDelay_time(delay_time: Double) {
        delay.time = AUValue(delay_time)
    }
    
    func playNewButton() {
        do {
            try engine777.start()
        } catch {
            //
        }
        do {
//            try samplePlayer.load(url: getFileURL(fileURL: fileURL))
//            print("單獨播放的文件:\(getFileURL(fileURL: "track1_drum1.m4a"))")
            try samplePlayer777.load(url : URL(fileURLWithPath: Bundle.main.path(forResource: "sample_drum_110_8_one.wav", ofType:nil)!))
            //Delay Setting
            delay.feedback = 0.9
            delay.time = 0.1
            
            //convolution start
//            convolutionSalt_one.start()
//            convolutionSalt_two.start()
            
            samplePlayer777.isLooping = true
            samplePlayer777.play()
//            dryWetMixer.play()

        } catch {
            // couldn't load file :(
        }
        
    }
    
}


