//
//  FileManageLogic.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
// Who is this file?
    // 1. File management of this application
        // 1.1 how to store the tracks
        // 1.2 which track can be palyed
        // 1.3 instrument resources
    // 2. Manage the engines and players
        // 2.1 effect setting
        // 2.2 player resource
    // 3. Icon image manage

import Foundation
import AudioUnit
import AudioKit
import SoundpipeAudioKit

class FileManageLogic: ObservableObject {
    // Call the
    var savedFileNames = SavedFileNames()
    // Which track can be played - Bool array
    @Published var whichToPlay: [Bool] = [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true]
   
    // String type of trackID
    private var trackID : String = ""

    //Tracks' files data
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
        "track13" : ["isPause" : "true",
                    "fileWay" : "track13_guitar1.m4a",
                   ],
        "track14" : ["isPause" : "true",
                    "fileWay" : "track11_guitar2.m4a",
                   ],
        "track15" : ["isPause" : "true",
                    "fileWay" : "track12_guitar3.m4a",
                   ],

    ]
    
    @Published var sendToBusIcon : String = "paperplane.circle"
    @Published var sendToBusIconPressed : String = "paperplane.circle.fill"
    
    //Bass resource - file mapping
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
    
    //String resource - file mapping
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
    
    //Piano resource - file mapping
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
    
    //Notes: engine, player, url, path
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
    //The tracks:
        // 1. url, path
        // 2. iswith : will be played or not
    //Pause flag
    @Published var isPause: Bool = true
    
    var singleFileName: String
    var url : URL
    var path : String
    @Published var isWish: Bool = false
    
    var singleFileName2: String
    var url2 : URL
    var path2 : String
    @Published var isWish2: Bool = false
    
    var singleFileName3: String
    var url3 : URL
    var path3 : String
    @Published var isWish3: Bool = false
    
    var singleFileName4: String
    var url4 : URL
    var path4 : String
    @Published var isWish4: Bool = false
    
    var singleFileName5: String
    var url5 : URL
    var path5 : String
    @Published var isWish5: Bool = false
    
    var singleFileName6: String
    var url6 : URL
    var path6 : String
    @Published var isWish6: Bool = false
    
    var singleFileName7: String
    var url7 : URL
    var path7 : String
    @Published var isWish7: Bool = false
    
    var singleFileName8: String
    var url8 : URL
    var path8 : String
    @Published var isWish8: Bool = false
    
    var singleFileName9: String
    var url9 : URL
    var path9 : String
    @Published var isWish9: Bool = false
    
    var singleFileName10: String
    var url10 : URL
    var path10 : String
    @Published var isWish10: Bool = false
    
    var singleFileName11: String
    var url11 : URL
    var path11 : String
    @Published var isWish11: Bool = false
    
    var singleFileName12: String
    var url12 : URL
    var path12 : String
    @Published var isWish12: Bool = false
    
    
    var singleFileName13: String
    var url13 : URL
    var path13 : String
    @Published var isWish13: Bool = false
    
    var singleFileName14: String
    var url14 : URL
    var path14 : String
    @Published var isWish14: Bool = false
    
    var singleFileName15: String
    var url15 : URL
    var path15 : String
    @Published var isWish15: Bool = false
    
    
    //Engine and Player - 1
    var engine1 = AudioEngine()
    var samplePlayer1 = AudioPlayer()
    //Delay Setting
    var delay1 : Delay
    var dryWetMixer1 : DryWetMixer
    var delaySetting1 = DelaySetting()
    //Reverb
    var reverb1 : Reverb
    var reverbMixer1 : DryWetMixer
    //convolution
    var convolutionSalt_one1 : Convolution
    var convolutionSalt_two1 : Convolution
    var convolutionMixer1 : DryWetMixer
    var saltMixer1 : DryWetMixer
    var url_convolutionSalt_one1 : URL
    var url_convolutionSalt_two1 : URL
    
    //Engine and Player - 2
    var engine2 = AudioEngine()
    var samplePlayer2 = AudioPlayer()
    //Delay Setting
    var delay2 : Delay
    var dryWetMixer2 : DryWetMixer
    var delaySetting2 = DelaySetting()
    //Reverb
    var reverb2 : Reverb
    var reverbMixer2 : DryWetMixer
    //convolution
    var convolutionSalt_one2 : Convolution
    var convolutionSalt_two2 : Convolution
    var convolutionMixer2 : DryWetMixer
    var saltMixer2 : DryWetMixer
    var url_convolutionSalt_one2 : URL
    var url_convolutionSalt_two2 : URL
    
    //Engine and Player - 3
    var engine3 = AudioEngine()
    var samplePlayer3 = AudioPlayer()
    //Delay Setting
    var delay3 : Delay
    var dryWetMixer3 : DryWetMixer
    var delaySetting3 = DelaySetting()
    //Reverb
    var reverb3 : Reverb
    var reverbMixer3 : DryWetMixer
    //convolution
    var convolutionSalt_one3 : Convolution
    var convolutionSalt_two3 : Convolution
    var convolutionMixer3 : DryWetMixer
    var saltMixer3 : DryWetMixer
    var url_convolutionSalt_one3 : URL
    var url_convolutionSalt_two3 : URL
    
    //Engine and Player - 4
    var engine4 = AudioEngine()
    var samplePlayer4 = AudioPlayer()
    //Delay Setting
    var delay4 : Delay
    var dryWetMixer4 : DryWetMixer
    var delaySetting4 = DelaySetting()
    //Reverb
    var reverb4 : Reverb
    var reverbMixer4 : DryWetMixer
    //convolution
    var convolutionSalt_one4 : Convolution
    var convolutionSalt_two4 : Convolution
    var convolutionMixer4 : DryWetMixer
    var saltMixer4 : DryWetMixer
    var url_convolutionSalt_one4 : URL
    var url_convolutionSalt_two4 : URL
    
    //Engine and Player - 5
    var engine5 = AudioEngine()
    var samplePlayer5 = AudioPlayer()
    //Delay Setting
    var delay5 : Delay
    var dryWetMixer5 : DryWetMixer
    var delaySetting5 = DelaySetting()
    //Reverb
    var reverb5 : Reverb
    var reverbMixer5 : DryWetMixer
    //convolution
    var convolutionSalt_one5 : Convolution
    var convolutionSalt_two5 : Convolution
    var convolutionMixer5 : DryWetMixer
    var saltMixer5 : DryWetMixer
    var url_convolutionSalt_one5 : URL
    var url_convolutionSalt_two5 : URL
    
    //Engine and Player - 6
    var engine6 = AudioEngine()
    var samplePlayer6 = AudioPlayer()
    //Delay Setting
    var delay6 : Delay
    var dryWetMixer6 : DryWetMixer
    var delaySetting6 = DelaySetting()
    //Reverb
    var reverb6 : Reverb
    var reverbMixer6 : DryWetMixer
    //convolution
    var convolutionSalt_one6 : Convolution
    var convolutionSalt_two6 : Convolution
    var convolutionMixer6 : DryWetMixer
    var saltMixer6 : DryWetMixer
    var url_convolutionSalt_one6 : URL
    var url_convolutionSalt_two6 : URL
    
    //Engine and Player - 7
    var engine7 = AudioEngine()
    var samplePlayer7 = AudioPlayer()
    //Delay Setting
    var delay7 : Delay
    var dryWetMixer7 : DryWetMixer
    var delaySetting7 = DelaySetting()
    //Reverb
    var reverb7 : Reverb
    var reverbMixer7 : DryWetMixer
    //convolution
    var convolutionSalt_one7 : Convolution
    var convolutionSalt_two7 : Convolution
    var convolutionMixer7 : DryWetMixer
    var saltMixer7 : DryWetMixer
    var url_convolutionSalt_one7 : URL
    var url_convolutionSalt_two7 : URL
    
    //Engine and Player - 8
    var engine8 = AudioEngine()
    var samplePlayer8 = AudioPlayer()
    //Delay Setting
    var delay8 : Delay
    var dryWetMixer8 : DryWetMixer
    var delaySetting8 = DelaySetting()
    //Reverb
    var reverb8 : Reverb
    var reverbMixer8 : DryWetMixer
    //convolution
    var convolutionSalt_one8 : Convolution
    var convolutionSalt_two8 : Convolution
    var convolutionMixer8 : DryWetMixer
    var saltMixer8 : DryWetMixer
    var url_convolutionSalt_one8 : URL
    var url_convolutionSalt_two8 : URL
    
    //Engine and Player - 9
    var engine9 = AudioEngine()
    var samplePlayer9 = AudioPlayer()
    //Delay Setting
    var delay9 : Delay
    var dryWetMixer9 : DryWetMixer
    var delaySetting9 = DelaySetting()
    //Reverb
    var reverb9 : Reverb
    var reverbMixer9 : DryWetMixer
    //convolution
    var convolutionSalt_one9 : Convolution
    var convolutionSalt_two9 : Convolution
    var convolutionMixer9 : DryWetMixer
    var saltMixer9 : DryWetMixer
    var url_convolutionSalt_one9 : URL
    var url_convolutionSalt_two9 : URL
    
    //Engine and Player - 10
    var engine10 = AudioEngine()
    var samplePlayer10 = AudioPlayer()
    //Delay Setting
    var delay10 : Delay
    var dryWetMixer10 : DryWetMixer
    var delaySetting10 = DelaySetting()
    //Reverb
    var reverb10 : Reverb
    var reverbMixer10 : DryWetMixer
    //convolution
    var convolutionSalt_one10 : Convolution
    var convolutionSalt_two10 : Convolution
    var convolutionMixer10 : DryWetMixer
    var saltMixer10 : DryWetMixer
    var url_convolutionSalt_one10 : URL
    var url_convolutionSalt_two10 : URL
    
    //Engine and Player - 11
    var engine11 = AudioEngine()
    var samplePlayer11 = AudioPlayer()
    //Delay Setting
    var delay11 : Delay
    var dryWetMixer11 : DryWetMixer
    var delaySetting11 = DelaySetting()
    //Reverb
    var reverb11 : Reverb
    var reverbMixer11 : DryWetMixer
    //convolution
    var convolutionSalt_one11 : Convolution
    var convolutionSalt_two11 : Convolution
    var convolutionMixer11 : DryWetMixer
    var saltMixer11 : DryWetMixer
    var url_convolutionSalt_one11 : URL
    var url_convolutionSalt_two11 : URL
    
    //Engine and Player - 12
    var engine12 = AudioEngine()
    var samplePlayer12 = AudioPlayer()
    //Delay Setting
    var delay12 : Delay
    var dryWetMixer12 : DryWetMixer
    var delaySetting12 = DelaySetting()
    //Reverb
    var reverb12 : Reverb
    var reverbMixer12 : DryWetMixer
    //convolution
    var convolutionSalt_one12 : Convolution
    var convolutionSalt_two12 : Convolution
    var convolutionMixer12 : DryWetMixer
    var saltMixer12 : DryWetMixer
    var url_convolutionSalt_one12 : URL
    var url_convolutionSalt_two12 : URL
    
    //Engine and Player - 13
    var engine13 = AudioEngine()
    var samplePlayer13 = AudioPlayer()
    //Delay Setting
    var delay13 : Delay
    var dryWetMixer13 : DryWetMixer
    var delaySetting13 = DelaySetting()
    //Reverb
    var reverb13 : Reverb
    var reverbMixer13 : DryWetMixer
    //convolution
    var convolutionSalt_one13 : Convolution
    var convolutionSalt_two13 : Convolution
    var convolutionMixer13 : DryWetMixer
    var saltMixer13 : DryWetMixer
    var url_convolutionSalt_one13 : URL
    var url_convolutionSalt_two13 : URL
    
    //Engine and Player - 14
    var engine14 = AudioEngine()
    var samplePlayer14 = AudioPlayer()
    //Delay Setting
    var delay14 : Delay
    var dryWetMixer14 : DryWetMixer
    var delaySetting14 = DelaySetting()
    //Reverb
    var reverb14 : Reverb
    var reverbMixer14 : DryWetMixer
    //convolution
    var convolutionSalt_one14 : Convolution
    var convolutionSalt_two14 : Convolution
    var convolutionMixer14 : DryWetMixer
    var saltMixer14 : DryWetMixer
    var url_convolutionSalt_one14 : URL
    var url_convolutionSalt_two14 : URL
    
    //Engine and Player - 15
    var engine15 = AudioEngine()
    var samplePlayer15 = AudioPlayer()
    //Delay Setting
    var delay15 : Delay
    var dryWetMixer15 : DryWetMixer
    var delaySetting15 = DelaySetting()
    //Reverb
    var reverb15 : Reverb
    var reverbMixer15 : DryWetMixer
    //convolution
    var convolutionSalt_one15 : Convolution
    var convolutionSalt_two15 : Convolution
    var convolutionMixer15 : DryWetMixer
    var saltMixer15 : DryWetMixer
    var url_convolutionSalt_one15 : URL
    var url_convolutionSalt_two15 : URL
    
    init() {
        
        //Engine and Player - 1
        //Delay
        delay1 = Delay(samplePlayer1)
        dryWetMixer1 = DryWetMixer(samplePlayer1, delay1, balance: AUValue(0.5)) //Using reverbMixers as input
        delay1.time = delaySetting1.time
        delay1.feedback = delaySetting1.feedback
        delay1.dryWetMix = 100
        dryWetMixer1.balance = delaySetting1.balance
        //Reverb
        reverb1 = Reverb(dryWetMixer1)
        reverb1.dryWetMix = 100
        reverb1.loadFactoryPreset(.cathedral)
        reverbMixer1 = DryWetMixer(dryWetMixer1, reverb1, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one1 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two1 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one1 = Convolution(samplePlayer1, impulseResponseFileURL: url_convolutionSalt_one1, partitionLength: 8_192)
        convolutionSalt_two1 = Convolution(samplePlayer1, impulseResponseFileURL: url_convolutionSalt_two1, partitionLength: 8_192)
        //make a mixser
        saltMixer1 = DryWetMixer(convolutionSalt_one1, convolutionSalt_two1, balance: AUValue(0.5))
        convolutionMixer1 = DryWetMixer(reverbMixer1, saltMixer1, balance: AUValue(0.5))
        engine1.output = convolutionMixer1
        
        
        //Engine and Player - 2
        //Delay
        delay2 = Delay(samplePlayer2)
        dryWetMixer2 = DryWetMixer(samplePlayer2, delay2, balance: AUValue(0.5)) //Using reverbMixers as input
        delay2.time = delaySetting2.time
        delay2.feedback = delaySetting2.feedback
        delay2.dryWetMix = 100
        dryWetMixer2.balance = delaySetting2.balance
        //Reverb
        reverb2 = Reverb(dryWetMixer2)
        reverb2.dryWetMix = 100
        reverb2.loadFactoryPreset(.cathedral)
        reverbMixer2 = DryWetMixer(dryWetMixer2, reverb2, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one2 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two2 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one2 = Convolution(samplePlayer2, impulseResponseFileURL: url_convolutionSalt_one2, partitionLength: 8_192)
        convolutionSalt_two2 = Convolution(samplePlayer2, impulseResponseFileURL: url_convolutionSalt_two2, partitionLength: 8_192)
        //make a mixser
        saltMixer2 = DryWetMixer(convolutionSalt_one2, convolutionSalt_two2, balance: AUValue(0.5))
        convolutionMixer2 = DryWetMixer(reverbMixer2, saltMixer2, balance: AUValue(0.5))
        engine2.output = convolutionMixer2
        
        //Engine and Player - 3
        //Delay
        delay3 = Delay(samplePlayer3)
        dryWetMixer3 = DryWetMixer(samplePlayer3, delay3, balance: AUValue(0.5)) //Using reverbMixers as input
        delay3.time = delaySetting3.time
        delay3.feedback = delaySetting3.feedback
        delay3.dryWetMix = 100
        dryWetMixer3.balance = delaySetting3.balance
        //Reverb
        reverb3 = Reverb(dryWetMixer3)
        reverb3.dryWetMix = 100
        reverb3.loadFactoryPreset(.cathedral)
        reverbMixer3 = DryWetMixer(dryWetMixer3, reverb3, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one3 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two3 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one3 = Convolution(samplePlayer3, impulseResponseFileURL: url_convolutionSalt_one3, partitionLength: 8_192)
        convolutionSalt_two3 = Convolution(samplePlayer3, impulseResponseFileURL: url_convolutionSalt_two3, partitionLength: 8_192)
        //make a mixser
        saltMixer3 = DryWetMixer(convolutionSalt_one3, convolutionSalt_two3, balance: AUValue(0.5))
        convolutionMixer3 = DryWetMixer(reverbMixer3, saltMixer3, balance: AUValue(0.5))
        engine3.output = convolutionMixer3
        
        
        //Engine and Player - 4
        //Delay
        delay4 = Delay(samplePlayer4)
        dryWetMixer4 = DryWetMixer(samplePlayer4, delay4, balance: AUValue(0.5)) //Using reverbMixers as input
        delay4.time = delaySetting4.time
        delay4.feedback = delaySetting4.feedback
        delay4.dryWetMix = 100
        dryWetMixer4.balance = delaySetting4.balance
        //Reverb
        reverb4 = Reverb(dryWetMixer4)
        reverb4.dryWetMix = 100
        reverb4.loadFactoryPreset(.cathedral)
        reverbMixer4 = DryWetMixer(dryWetMixer4, reverb4, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one4 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two4 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one4 = Convolution(samplePlayer4, impulseResponseFileURL: url_convolutionSalt_one4, partitionLength: 8_192)
        convolutionSalt_two4 = Convolution(samplePlayer4, impulseResponseFileURL: url_convolutionSalt_two4, partitionLength: 8_192)
        //make a mixser
        saltMixer4 = DryWetMixer(convolutionSalt_one4, convolutionSalt_two4, balance: AUValue(0.5))
        convolutionMixer4 = DryWetMixer(reverbMixer4, saltMixer4, balance: AUValue(0.5))
        engine4.output = convolutionMixer4
        
        //Engine and Player - 5
        //Delay
        delay5 = Delay(samplePlayer5)
        dryWetMixer5 = DryWetMixer(samplePlayer5, delay5, balance: AUValue(0.5)) //Using reverbMixers as input
        delay5.time = delaySetting5.time
        delay5.feedback = delaySetting5.feedback
        delay5.dryWetMix = 100
        dryWetMixer5.balance = delaySetting5.balance
        //Reverb
        reverb5 = Reverb(dryWetMixer5)
        reverb5.dryWetMix = 100
        reverb5.loadFactoryPreset(.cathedral)
        reverbMixer5 = DryWetMixer(dryWetMixer5, reverb5, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one5 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two5 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one5 = Convolution(samplePlayer5, impulseResponseFileURL: url_convolutionSalt_one5, partitionLength: 8_192)
        convolutionSalt_two5 = Convolution(samplePlayer5, impulseResponseFileURL: url_convolutionSalt_two5, partitionLength: 8_192)
        //make a mixser
        saltMixer5 = DryWetMixer(convolutionSalt_one5, convolutionSalt_two5, balance: AUValue(0.5))
        convolutionMixer5 = DryWetMixer(reverbMixer5, saltMixer5, balance: AUValue(0.5))
        engine5.output = convolutionMixer5
        
        
        //Engine and Player - 6
        //Delay
        delay6 = Delay(samplePlayer6)
        dryWetMixer6 = DryWetMixer(samplePlayer6, delay6, balance: AUValue(0.5)) //Using reverbMixers as input
        delay6.time = delaySetting6.time
        delay6.feedback = delaySetting6.feedback
        delay6.dryWetMix = 100
        dryWetMixer6.balance = delaySetting6.balance
        //Reverb
        reverb6 = Reverb(dryWetMixer6)
        reverb6.dryWetMix = 100
        reverb6.loadFactoryPreset(.cathedral)
        reverbMixer6 = DryWetMixer(dryWetMixer6, reverb6, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one6 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two6 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one6 = Convolution(samplePlayer6, impulseResponseFileURL: url_convolutionSalt_one6, partitionLength: 8_192)
        convolutionSalt_two6 = Convolution(samplePlayer6, impulseResponseFileURL: url_convolutionSalt_two6, partitionLength: 8_192)
        //make a mixser
        saltMixer6 = DryWetMixer(convolutionSalt_one6, convolutionSalt_two6, balance: AUValue(0.5))
        convolutionMixer6 = DryWetMixer(reverbMixer6, saltMixer6, balance: AUValue(0.5))
        engine6.output = convolutionMixer6
        
        //Engine and Player - 7
        //Delay
        delay7 = Delay(samplePlayer7)
        dryWetMixer7 = DryWetMixer(samplePlayer7, delay7, balance: AUValue(0.5)) //Using reverbMixers as input
        delay7.time = delaySetting7.time
        delay7.feedback = delaySetting7.feedback
        delay7.dryWetMix = 100
        dryWetMixer7.balance = delaySetting7.balance
        //Reverb
        reverb7 = Reverb(dryWetMixer7)
        reverb7.dryWetMix = 100
        reverb7.loadFactoryPreset(.cathedral)
        reverbMixer7 = DryWetMixer(dryWetMixer7, reverb7, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one7 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two7 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one7 = Convolution(samplePlayer7, impulseResponseFileURL: url_convolutionSalt_one7, partitionLength: 8_192)
        convolutionSalt_two7 = Convolution(samplePlayer7, impulseResponseFileURL: url_convolutionSalt_two7, partitionLength: 8_192)
        //make a mixser
        saltMixer7 = DryWetMixer(convolutionSalt_one7, convolutionSalt_two7, balance: AUValue(0.5))
        convolutionMixer7 = DryWetMixer(reverbMixer7, saltMixer7, balance: AUValue(0.5))
        engine7.output = convolutionMixer7
        
        
        //Engine and Player - 8
        //Delay
        delay8 = Delay(samplePlayer8)
        dryWetMixer8 = DryWetMixer(samplePlayer8, delay8, balance: AUValue(0.5)) //Using reverbMixers as input
        delay8.time = delaySetting8.time
        delay8.feedback = delaySetting8.feedback
        delay8.dryWetMix = 100
        dryWetMixer8.balance = delaySetting8.balance
        //Reverb
        reverb8 = Reverb(dryWetMixer8)
        reverb8.dryWetMix = 100
        reverb8.loadFactoryPreset(.cathedral)
        reverbMixer8 = DryWetMixer(dryWetMixer8, reverb8, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one8 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two8 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one8 = Convolution(samplePlayer8, impulseResponseFileURL: url_convolutionSalt_one8, partitionLength: 8_192)
        convolutionSalt_two8 = Convolution(samplePlayer8, impulseResponseFileURL: url_convolutionSalt_two8, partitionLength: 8_192)
        //make a mixser
        saltMixer8 = DryWetMixer(convolutionSalt_one8, convolutionSalt_two8, balance: AUValue(0.5))
        convolutionMixer8 = DryWetMixer(reverbMixer8, saltMixer8, balance: AUValue(0.5))
        engine8.output = convolutionMixer8
        
        //Engine and Player - 9
        //Delay
        delay9 = Delay(samplePlayer9)
        dryWetMixer9 = DryWetMixer(samplePlayer9, delay9, balance: AUValue(0.5)) //Using reverbMixers as input
        delay9.time = delaySetting9.time
        delay9.feedback = delaySetting9.feedback
        delay9.dryWetMix = 100
        dryWetMixer9.balance = delaySetting9.balance
        //Reverb
        reverb9 = Reverb(dryWetMixer9)
        reverb9.dryWetMix = 100
        reverb9.loadFactoryPreset(.cathedral)
        reverbMixer9 = DryWetMixer(dryWetMixer9, reverb9, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one9 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two9 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one9 = Convolution(samplePlayer9, impulseResponseFileURL: url_convolutionSalt_one9, partitionLength: 8_192)
        convolutionSalt_two9 = Convolution(samplePlayer9, impulseResponseFileURL: url_convolutionSalt_two9, partitionLength: 8_192)
        //make a mixser
        saltMixer9 = DryWetMixer(convolutionSalt_one9, convolutionSalt_two9, balance: AUValue(0.5))
        convolutionMixer9 = DryWetMixer(reverbMixer9, saltMixer9, balance: AUValue(0.5))
        engine9.output = convolutionMixer9
        
        
        //Engine and Player - 10
        //Delay
        delay10 = Delay(samplePlayer10)
        dryWetMixer10 = DryWetMixer(samplePlayer10, delay10, balance: AUValue(0.5)) //Using reverbMixers as input
        delay10.time = delaySetting10.time
        delay10.feedback = delaySetting10.feedback
        delay10.dryWetMix = 100
        dryWetMixer10.balance = delaySetting10.balance
        //Reverb
        reverb10 = Reverb(dryWetMixer10)
        reverb10.dryWetMix = 100
        reverb10.loadFactoryPreset(.cathedral)
        reverbMixer10 = DryWetMixer(dryWetMixer10, reverb10, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one10 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two10 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one10 = Convolution(samplePlayer10, impulseResponseFileURL: url_convolutionSalt_one10, partitionLength: 8_192)
        convolutionSalt_two10 = Convolution(samplePlayer10, impulseResponseFileURL: url_convolutionSalt_two10, partitionLength: 8_192)
        //make a mixser
        saltMixer10 = DryWetMixer(convolutionSalt_one10, convolutionSalt_two10, balance: AUValue(0.5))
        convolutionMixer10 = DryWetMixer(reverbMixer10, saltMixer10, balance: AUValue(0.5))
        engine10.output = convolutionMixer10
        
        //Engine and Player - 11
        //Delay
        delay11 = Delay(samplePlayer11)
        dryWetMixer11 = DryWetMixer(samplePlayer11, delay11, balance: AUValue(0.5)) //Using reverbMixers as input
        delay11.time = delaySetting11.time
        delay11.feedback = delaySetting11.feedback
        delay11.dryWetMix = 100
        dryWetMixer11.balance = delaySetting11.balance
        //Reverb
        reverb11 = Reverb(dryWetMixer11)
        reverb11.dryWetMix = 100
        reverb11.loadFactoryPreset(.cathedral)
        reverbMixer11 = DryWetMixer(dryWetMixer11, reverb11, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one11 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two11 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one11 = Convolution(samplePlayer11, impulseResponseFileURL: url_convolutionSalt_one11, partitionLength: 8_192)
        convolutionSalt_two11 = Convolution(samplePlayer11, impulseResponseFileURL: url_convolutionSalt_two11, partitionLength: 8_192)
        //make a mixser
        saltMixer11 = DryWetMixer(convolutionSalt_one11, convolutionSalt_two11, balance: AUValue(0.5))
        convolutionMixer11 = DryWetMixer(reverbMixer11, saltMixer11, balance: AUValue(0.5))
        engine11.output = convolutionMixer11
        
        
        //Engine and Player - 12
        //Delay
        delay12 = Delay(samplePlayer12)
        dryWetMixer12 = DryWetMixer(samplePlayer12, delay12, balance: AUValue(0.5)) //Using reverbMixers as input
        delay12.time = delaySetting12.time
        delay12.feedback = delaySetting12.feedback
        delay12.dryWetMix = 100
        dryWetMixer12.balance = delaySetting12.balance
        //Reverb
        reverb12 = Reverb(dryWetMixer12)
        reverb12.dryWetMix = 100
        reverb12.loadFactoryPreset(.cathedral)
        reverbMixer12 = DryWetMixer(dryWetMixer12, reverb12, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one12 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two12 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one12 = Convolution(samplePlayer12, impulseResponseFileURL: url_convolutionSalt_one12, partitionLength: 8_192)
        convolutionSalt_two12 = Convolution(samplePlayer12, impulseResponseFileURL: url_convolutionSalt_two12, partitionLength: 8_192)
        //make a mixser
        saltMixer12 = DryWetMixer(convolutionSalt_one12, convolutionSalt_two12, balance: AUValue(0.5))
        convolutionMixer12 = DryWetMixer(reverbMixer12, saltMixer12, balance: AUValue(0.5))
        engine12.output = convolutionMixer12
        
        //Engine and Player - 13
        //Delay
        delay13 = Delay(samplePlayer13)
        dryWetMixer13 = DryWetMixer(samplePlayer13, delay13, balance: AUValue(0.5)) //Using reverbMixers as input
        delay13.time = delaySetting13.time
        delay13.feedback = delaySetting13.feedback
        delay13.dryWetMix = 100
        dryWetMixer13.balance = delaySetting13.balance
        //Reverb
        reverb13 = Reverb(dryWetMixer13)
        reverb13.dryWetMix = 100
        reverb13.loadFactoryPreset(.cathedral)
        reverbMixer13 = DryWetMixer(dryWetMixer13, reverb13, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one13 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two13 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one13 = Convolution(samplePlayer10, impulseResponseFileURL: url_convolutionSalt_one13, partitionLength: 8_192)
        convolutionSalt_two13 = Convolution(samplePlayer10, impulseResponseFileURL: url_convolutionSalt_two13, partitionLength: 8_192)
        //make a mixser
        saltMixer13 = DryWetMixer(convolutionSalt_one13, convolutionSalt_two13, balance: AUValue(0.5))
        convolutionMixer13 = DryWetMixer(reverbMixer13, saltMixer13, balance: AUValue(0.5))
        engine10.output = convolutionMixer10
        
        //Engine and Player - 14
        //Delay
        delay14 = Delay(samplePlayer14)
        dryWetMixer14 = DryWetMixer(samplePlayer14, delay14, balance: AUValue(0.5)) //Using reverbMixers as input
        delay14.time = delaySetting14.time
        delay14.feedback = delaySetting14.feedback
        delay14.dryWetMix = 100
        dryWetMixer14.balance = delaySetting14.balance
        //Reverb
        reverb14 = Reverb(dryWetMixer14)
        reverb14.dryWetMix = 100
        reverb14.loadFactoryPreset(.cathedral)
        reverbMixer14 = DryWetMixer(dryWetMixer14, reverb14, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one14 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two14 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one14 = Convolution(samplePlayer14, impulseResponseFileURL: url_convolutionSalt_one14, partitionLength: 8_192)
        convolutionSalt_two14 = Convolution(samplePlayer14, impulseResponseFileURL: url_convolutionSalt_two14, partitionLength: 8_192)
        //make a mixser
        saltMixer14 = DryWetMixer(convolutionSalt_one14, convolutionSalt_two14, balance: AUValue(0.5))
        convolutionMixer14 = DryWetMixer(reverbMixer14, saltMixer14, balance: AUValue(0.5))
        engine14.output = convolutionMixer14
        
        
        //Engine and Player - 15
        //Delay
        delay15 = Delay(samplePlayer15)
        dryWetMixer15 = DryWetMixer(samplePlayer15, delay15, balance: AUValue(0.5)) //Using reverbMixers as input
        delay15.time = delaySetting15.time
        delay15.feedback = delaySetting15.feedback
        delay15.dryWetMix = 100
        dryWetMixer15.balance = delaySetting15.balance
        //Reverb
        reverb15 = Reverb(dryWetMixer15)
        reverb15.dryWetMix = 100
        reverb15.loadFactoryPreset(.cathedral)
        reverbMixer15 = DryWetMixer(dryWetMixer15, reverb15, balance: AUValue(0.5))
        //Convolution
        //Path for convolution
        url_convolutionSalt_one15 = Bundle.main.url(forResource: "salt_one", withExtension: "wav")!
        url_convolutionSalt_two15 = Bundle.main.url(forResource: "salt_two", withExtension: "wav")!
        convolutionSalt_one15 = Convolution(samplePlayer15, impulseResponseFileURL: url_convolutionSalt_one15, partitionLength: 8_192)
        convolutionSalt_two15 = Convolution(samplePlayer15, impulseResponseFileURL: url_convolutionSalt_two15, partitionLength: 8_192)
        //make a mixser
        saltMixer15 = DryWetMixer(convolutionSalt_one15, convolutionSalt_two15, balance: AUValue(0.5))
        convolutionMixer15 = DryWetMixer(reverbMixer15, saltMixer15, balance: AUValue(0.5))
        engine15.output = convolutionMixer15
        
        
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
        
        self.singleFileName13 = "sample_drum_110_8_one.wav"
        self.path13 = Bundle.main.path(forResource: singleFileName13, ofType:nil)!
        self.url13 = URL(fileURLWithPath: path13)
        
        self.singleFileName14 = "sample_drum_110_8_one.wav"
        self.path14 = Bundle.main.path(forResource: singleFileName14, ofType:nil)!
        self.url14 = URL(fileURLWithPath: path14)
        
        self.singleFileName15 = "sample_drum_110_8_one.wav"
        self.path15 = Bundle.main.path(forResource: singleFileName15, ofType:nil)!
        self.url15 = URL(fileURLWithPath: path15)
        
        
        
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
    
    
    // Change current instrument into Bass
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
    
    // Change current instrument into String
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
    
    // Change current instrument into Piano
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
    
    //Return the file path
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        }
    //Return the file path as URL type
    func getFileURL(fileURL: String) -> URL {
        let path = getDocumentsDirectory().appendingPathComponent(fileURL)
        return path as URL
        }
    
    
    // Play a single file
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
    
    // Play a single track
    func playSingleTrack(fileURL: String, samplePlayer: AudioPlayer, engine: AudioEngine){
        do {
            try engine.start()
            
        } catch {
            //
        }
        do {

            try samplePlayer.load(url: getFileURL(fileURL: fileURL))

//            samplePlayer.isLooping = true
            samplePlayer.play()

        } catch {
            print("player fail..")
        }
    }
    // Stop a single track
    func stopSingleTrack(fileURL: String, samplePlayer: AudioPlayer, engine: AudioEngine){
        samplePlayer.stop()
        engine.stop()
    }
    
    // Play the tracks - final creation
    func playResuting(){
        self.isPause = false
        for i in 1..<13 {
            print("第\(i)次掃描")
//            if self.whichToPlay[i] {
//                self.playSingle(fileURL: fileNames["track\(i)"]!["fileWay"]!, samplePlayer: self.samplePlayer, engine: self.engine)
//            }
            if self.whichToPlay[i] && i == 1 {
                playNewButton(engine: engine1, samplePlayer: samplePlayer1, fileURL: fileNames["track1"]!["fileWay"]!)
            } else if i == 2 && self.whichToPlay[i] {
                playNewButton(engine: engine2, samplePlayer: samplePlayer2, fileURL: fileNames["track2"]!["fileWay"]!)
            } else if i == 3 && self.whichToPlay[i] {
                playNewButton(engine: engine3, samplePlayer: samplePlayer3, fileURL: fileNames["track3"]!["fileWay"]!)
            } else if i == 4 && self.whichToPlay[i] {
                playNewButton(engine: engine4, samplePlayer: samplePlayer4, fileURL: fileNames["track4"]!["fileWay"]!)
            } else if i == 5 && self.whichToPlay[i] {
                playNewButton(engine: engine5, samplePlayer: samplePlayer5, fileURL: fileNames["track5"]!["fileWay"]!)
            } else if i == 6 && self.whichToPlay[i] {
                playNewButton(engine: engine6, samplePlayer: samplePlayer6, fileURL: fileNames["track6"]!["fileWay"]!)
            } else if i == 7 && self.whichToPlay[i] {
                playNewButton(engine: engine7, samplePlayer: samplePlayer7, fileURL: fileNames["track7"]!["fileWay"]!)
            } else if i == 8 && self.whichToPlay[i] {
                playNewButton(engine: engine8, samplePlayer: samplePlayer8, fileURL: fileNames["track8"]!["fileWay"]!)
            } else if i == 9 && self.whichToPlay[i] {
                playNewButton(engine: engine9, samplePlayer: samplePlayer9, fileURL: fileNames["track9"]!["fileWay"]!)
            } else if i == 10 && self.whichToPlay[i] {
                playNewButton(engine: engine10, samplePlayer: samplePlayer10, fileURL: fileNames["track10"]!["fileWay"]!)
            } else if i == 11 && self.whichToPlay[i] {
                playNewButton(engine: engine11, samplePlayer: samplePlayer11, fileURL: fileNames["track11"]!["fileWay"]!)
            } else if i == 12 && self.whichToPlay[i] {
                playNewButton(engine: engine1, samplePlayer: samplePlayer12, fileURL: fileNames["track12"]!["fileWay"]!)
            }
        }
        
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
        engine1.stop()
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
        
        samplePlayer1.stop()
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
    
    // Helper - set track flag - close the track
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
    
    // Helper - Which track is going to record
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
    // Helper - clear recording flags
    func reloding(){
        
    }
    // Helper - Which track is going to play - add to bus
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
    
    
    //Sound effects Settings
    func changeConvolution_balance(convolution_balance: AUValue, saltMixer: DryWetMixer){
        saltMixer.balance = convolution_balance
    }
    
    //Reverb setting
    func change_reverb(place: String, reverb: Reverb) {
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

    // Delay balance setting
    func changeDelay_balance(delay_balance: Double, dryWetMixer: DryWetMixer) {
        dryWetMixer.balance = AUValue(delay_balance)
    }
    // Delay feedback setting
    func changeDelay_feedback(delay_feedback: Double, delay: Delay) {
        delay.feedback = AUValue(delay_feedback)
    }
    // Delay time setting
    func changeDelay_time(delay_time: Double, delay: Delay) {
        delay.time = AUValue(delay_time)
    }
    
    // Start track - press the button to start
    func playNewButton(engine: AudioEngine, samplePlayer: AudioPlayer, fileURL: String) {
        do {
            try engine.start()
        } catch {
            //
        }
        do {
            try samplePlayer.load(url: getFileURL(fileURL: fileURL))
//            print("單獨播放的文件:\(getFileURL(fileURL: "track1_drum1.m4a"))")
//            try samplePlayer.load(url : URL(fileURLWithPath: Bundle.main.path(forResource: "sample_drum_110_8_one.wav", ofType:nil)!))
            //Delay Setting
//            delay1.feedback = 0.9
//            delay1.time = 0.1
            
            //convolution start
//            convolutionSalt_one.start()
//            convolutionSalt_two.start()
            
            samplePlayer.isLooping = true
            samplePlayer.play()


        } catch {
            // couldn't load file :(
        }
        
    }
    
}


