//
//  RecordingLogic.swift
//  HandyBand
//
//  Created by Dan on 11/8/21.
//Who is this file?
    // 1. To record track
    // 2. Count segements of each recording

import Foundation
import AVFoundation
import AudioKit

class RecordingLogic: ObservableObject {
    //Call TimeCountLogic class
    private var smallDangDang = TimeCountLogic()
    // Recoding speed(BPM: beat per minute)
    @Published var speed: Double = 50
    //Current place of a recording
    @Published var currentMetro: Int = 0
    @Published var currentRecordingCount: Int = 0
    // The total segements to record
    @Published var metroWish: Int = 8 // how many metro wishing to record based on current speed, after 4 intro beats
    

    // Whether it's recording now
    @Published var isRecording: Bool = false
    // Whether it's listening the last recording
    @Published var isListening: Bool = false
    @Published var isCountFour: Bool = false
    
    //Button controller - Flag array -> Which track is recoding
    @Published var buttonLights : [Bool] = [true, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    //Which track is recoding
    @Published var whichButtonLight : Int = 0
    
    // Player of listening the last one
    var avPlayer = AVAudioPlayer()
    // File url, path, filename
    var url: URL?
    var path: String?
    var filename: String = ""
    
    //How the files are saved - From SavedFukeNames class
    var saveFileNames = SavedFileNames()
    
    //The recorder
    private var sampleRecorder: AVAudioRecorder?
    //The shared aduiosession
    var audioSession = AVAudioSession.sharedInstance()

    
    init() {
        // Get the application storage path
        let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
            FileManager.SearchPathDomainMask.userDomainMask).first
        // Get the track1 path -> URL
        let audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track1"]!["fileWay"]!)
        
        // The shared audio session setting
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
        } catch {
            //
        }
        
        // Define the recorder setting : rate, channel(mono/stereo)
        let recorderSetting = [AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC as UInt32),
                               AVSampleRateKey: 44100.0,
                               AVNumberOfChannelsKey: 2 ]
        // Where is the recording about to save at
       self.sampleRecorder = try? AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
        // Set MeteringEnabled and ready to record
       self.sampleRecorder?.isMeteringEnabled = true
       self.sampleRecorder?.prepareToRecord()
    }
    
    //Start recoding
    func startRecording(toWhichLights: Int) {
        //Settings before recording: choose Which FILE to save
        let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
            FileManager.SearchPathDomainMask.userDomainMask).first // as! NSURL
        
        var audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track1"]!["fileWay"]!)

        // Based on which recoding button is pressed -> Where is the recording about to save at
        switch toWhichLights {
        case 1:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track1"]!["fileWay"]!)
        case 2:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track2"]!["fileWay"]!)
        case 3:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track3"]!["fileWay"]!)
        case 4:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track4"]!["fileWay"]!)
        case 5:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track5"]!["fileWay"]!)
        case 6:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track6"]!["fileWay"]!)
        case 7:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track7"]!["fileWay"]!)
        case 8:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track8"]!["fileWay"]!)
        case 9:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track9"]!["fileWay"]!)
        case 10:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track10"]!["fileWay"]!)
        case 11:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track11"]!["fileWay"]!)
        case 12:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track12"]!["fileWay"]!)
        case 13:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track13"]!["fileWay"]!)
        case 14:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track14"]!["fileWay"]!)
        case 15:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track15"]!["fileWay"]!)
        default:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track1"]!["fileWay"]!)
        }
        
        // After each recording, set the shared audioSession again to prepare next recording
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
        } catch {
            //
        }

        let recorderSetting = [AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC as UInt32),
                               AVSampleRateKey: 44100.0,
                               AVNumberOfChannelsKey: 2 ]

        self.sampleRecorder = try? AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
        self.sampleRecorder?.isMeteringEnabled = true
        self.sampleRecorder?.prepareToRecord()
        

        //THE REAL Recording Begin
        if let recorder = sampleRecorder {
            // Is the recorder recording?
            if !recorder.isRecording {
                let audioSession = AVAudioSession.sharedInstance()
                do {
                    // let the audiio session active -> true
                    try audioSession.setActive(true)
                } catch {
                    //
                }
                
                // Before recording -> 4 bests sound (dang..dang..dang..dang..) before recoding
                Timer.scheduledTimer(withTimeInterval: 60 / speed, repeats: true) { timerDeliver in
                    //play "dang" sound
                    self.smallDangDang.dangDangDang()
                    //Count "dang"
                    self.currentMetro += 1
//                    print("現在的\(self.currentMetro)")

                    // sound "dand" 4 times
                    if self.currentMetro > 3 {
                        self.isCountFour = true
                        timerDeliver.invalidate()
                        self.currentMetro = 0
                                            
                        //Start recording current track
//                        print(" 4.休眠開始 。。")
//                        sleep(1)
//                        print(" 5.休眠結束 。。")
//                        usleep(useconds_t(1000000 * Double(doubleStr)))
                        
                        //Start recording
//                        recorder.record()
//                        print(" 6.開始錄製了 。。")
//                        print("7.現在的錄製狀態: \(self.isRecording)")
                        
                        //Based on how many segements wishing to record. After certain segement, stop record
                        Timer.scheduledTimer(withTimeInterval: 60 / self.speed, repeats: true) { timerDeliver in
//                            self.smallDangDang.dangDangDang()
//                            self.currentMetro += 1
                            self.currentRecordingCount += 1
//                            print("8.现在第\(self.currentRecordingCount)拍")
                            if self.currentRecordingCount == 1 {
                                //Start recording
                                recorder.record()
                            }
                            if self.currentRecordingCount > self.metroWish {
                                self.stopRecording()
                                timerDeliver.invalidate()
                                self.isRecording = !self.isRecording
                                self.isCountFour = false
                                self.currentRecordingCount = 0
//                                self.currentMetro = 0
//                                print(" 9.開始結束 。。")
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Every time, only one recording track can be recorded
    func onlyOneButtonLights(index: Int) {
        for i in 1..<self.buttonLights.count {
            buttonLights[i] = false
        }
        buttonLights[index] = true
    }
    
    // Stop recording
    func stopRecording() {
        if let recorder = sampleRecorder {
            if recorder.isRecording {
                sampleRecorder?.stop()

//                let audioSession = AVAudioSession.sharedInstance()
//                do {
//
//                    try audioSession.setActive(false)
//                } catch {
//                    print(error)
//                }
//                isRecording = !isRecording

            }
            
        }
    }
    
    // Get current application document path
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        }
    // Return the path as URL type
    func getFileURL(filename: String) -> URL {
        let path = getDocumentsDirectory().appendingPathComponent(filename)
        return path as URL
        }
    
//    func getLocalStorage() -> URL {
//        let path = getDocumentsDirectory().appendingPathComponent("recording.m4a")
//        return path as URL
//        let originalUrls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let url_current = originalUrls[wichOne]
//        print(url_current)
//        return url_current
//    }
    
    //Play the last recording - current version, has been canceled - in future it might be useful
    func playThePotencial(filename: String, samplePlayer: AudioPlayer, engine: AudioEngine) {
        if let recorder = sampleRecorder {
           if !recorder.isRecording {
               avPlayer = try! AVAudioPlayer(contentsOf: getFileURL(filename: filename))
               print(getFileURL(filename: filename))

               avPlayer.play()
           }
        }
    }
    
    // Stop listening the last recording
    func listeningStop() {
        avPlayer.stop()
    }

}
