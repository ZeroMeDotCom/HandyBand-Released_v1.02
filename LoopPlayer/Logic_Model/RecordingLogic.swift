//
//  RecordingLogic.swift
//  LoopPlayer
//
//  Created by Dan on 11/8/21.
//

import Foundation
import AVFoundation
import AudioKit

class RecordingLogic: ObservableObject {
    private var smallDangDang = TimeCountLogic()
    private var speed: Double = 60
    private var currentMetro: Int = 1
    private var metroWish: Int = 4
    
    @Published var engine = AudioEngine()
    @Published var samplePlayer = AudioPlayer()
    @Published var engine2 = AudioEngine()
    @Published var samplePlayer2 = AudioPlayer()
    @Published var engine3 = AudioEngine()
    @Published var samplePlayer3 = AudioPlayer()
    
    @Published var isRecording: Bool = false
    @Published var isListening: Bool = false
    
    //Button controller
    @Published var buttonLights : [Bool] = [true, false, false, false, false, false, false, false, false, false, false, false, false]
    @Published var whichButtonLight : Int = 0
    
    var avPlayer = AVAudioPlayer()
    var url: URL?
    var path: String?
    var filename: String = ""
    var trackTimes = 1
    
    var saveFileNames = SavedFileNames()
    
    var audioFileName : String!
    var audioFileName2 : String!
    var audioFileName3 : String!
    
    private var sampleRecorder: AVAudioRecorder?
    var audioSession = AVAudioSession.sharedInstance()

    
    init() {
        audioFileName = saveFileNames.fileNames["track1"]!["fileWay"]!
        audioFileName2 = saveFileNames.fileNames["track2"]!["fileWay"]!
        audioFileName3 = saveFileNames.fileNames["track3"]!["fileWay"]!
//        var myDouble = 60 / speed
//        var doubleStr = String(format: "%.3f", myDouble)
//
        engine.output = samplePlayer
        engine2.output = samplePlayer2
        engine3.output = samplePlayer3
        
        //配置存查空間 audioFileURL - 設置
//         let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
//             FileManager.SearchPathDomainMask.userDomainMask).first
//
//         let audioFileURL = directoryURL!.appendingPathComponent(audioFileName)
//        print(audioFileURL)
//
//
//
//         // Setup audio session
//         let audioSession = AVAudioSession.sharedInstance()
//         do {
//             try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
//         } catch {
//             //
//         }
//
//         // Define the recorder setting
//         let recorderSetting = [AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC as UInt32),
//                                AVSampleRateKey: 44100.0,
//                                AVNumberOfChannelsKey: 2 ]
//
//        //配置存查空間 audioFileURL - 注入
//        self.sampleRecorder = try? AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
//        self.sampleRecorder?.isMeteringEnabled = true
//        self.sampleRecorder?.prepareToRecord()
//        print("初始化有没有recorder?:\(self.sampleRecorder?.url)")
        let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
            FileManager.SearchPathDomainMask.userDomainMask).first
        
        let audioFileURL = directoryURL!.appendingPathComponent(audioFileName)
       print(audioFileURL)
        
        // Setup audio session
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
        } catch {
            //
        }
        
        // Define the recorder setting
        let recorderSetting = [AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC as UInt32),
                               AVSampleRateKey: 44100.0,
                               AVNumberOfChannelsKey: 2 ]
        
       self.sampleRecorder = try? AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
       self.sampleRecorder?.isMeteringEnabled = true
       self.sampleRecorder?.prepareToRecord()
       print("有没初始化？： \(sampleRecorder)")
    }
    
    func startRecording(toWhichLights: Int) {
        print("進入錄製函數")
        //Settings before recording: choose Which FILE to save
        let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
            FileManager.SearchPathDomainMask.userDomainMask).first // as! NSURL
        
        //Old times Text using
//         trackTimes += 1
        var audioFileURL = directoryURL!.appendingPathComponent(audioFileName)
        print("進入switch之前: \(audioFileURL)")
        switch toWhichLights {
        case 1:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track1"]!["fileWay"]!)
        case 2:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track2"]!["fileWay"]!)
        case 3:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track3"]!["fileWay"]!)
        case 4:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track4"]!["fileWay"]!)
            print("選擇的4: \(audioFileURL)")
        case 5:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["trac5"]!["fileWay"]!)
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
        default:
            audioFileURL = directoryURL!.appendingPathComponent(saveFileNames.fileNames["track1"]!["fileWay"]!)
        }
//         if trackTimes == 2 {
//             audioFileURL = directoryURL!.appendingPathComponent(audioFileName2)
//             print(audioFileURL)
//         } else if trackTimes == 3 {
//             audioFileURL = directoryURL!.appendingPathComponent(audioFileName3)
//             print(audioFileURL)
//         } else {
//             audioFileURL = directoryURL!.appendingPathComponent(audioFileName)
//             print(audioFileURL)
//         }
        
        print("錄製的路徑：\(audioFileURL)")
        // Setup audio session
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
        } catch {
            //
        }

        // Define the recorder setting
        let recorderSetting = [AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC as UInt32),
                               AVSampleRateKey: 44100.0,
                               AVNumberOfChannelsKey: 2 ]

        self.sampleRecorder = try? AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
        self.sampleRecorder?.isMeteringEnabled = true
        self.sampleRecorder?.prepareToRecord()
        
        print(sampleRecorder)
        print("進入正式錄製函數之前")
        print("錄製通道: \(toWhichLights)")
        //THE REAL Recording
        if let recorder = sampleRecorder {
            print("進入正式錄製函數")
            if !recorder.isRecording {
                print("还在录制吗？")
                let audioSession = AVAudioSession.sharedInstance()
                
                do {
                    try audioSession.setActive(true)
                } catch {
                    //
                }
                
                // Start recording
//                recorder.record()
                Timer.scheduledTimer(withTimeInterval: 60 / speed, repeats: true) { timerDeliver in
                    self.smallDangDang.dangDangDang()
                    print(self.currentMetro)
                    self.currentMetro += 1
                    
                    if self.currentMetro > self.metroWish {
                        print(self.currentMetro)
                        timerDeliver.invalidate()
//                        self.isRecording = !self.isRecording
                        self.currentMetro = 1
                        
        //                sleep(1)
        //                self.readyDangDang(speed: speed)
                        
                        //開始錄製
                        sleep(1)
//                        usleep(useconds_t(1000000 * Double(doubleStr)))
                        recorder.record()
                        print(" 開始錄製了 。。")
                        print("現在的錄製狀態: \(self.isRecording)")
                        
                        //多久之後結束 60 / speed 響4下的長度
                        Timer.scheduledTimer(withTimeInterval: 60 / self.speed, repeats: true) { timerDeliver in
                            self.smallDangDang.dangDangDang()
                            print(self.currentMetro)
                            self.currentMetro += 1
                            
                            if self.currentMetro > self.metroWish {
                                print(self.currentMetro)
                                timerDeliver.invalidate()
                                self.isRecording = !self.isRecording
                                self.currentMetro = 1
                                self.stopRecording()
                            }
                        }
                    }
                }
            }
        }
    }
    
    func onlyOneButtonLights(index: Int) {
        for i in 1..<self.buttonLights.count {
            buttonLights[i] = false
        }
        buttonLights[index] = true
    }
    
    func stopRecording() {
        if let recorder = sampleRecorder {
            if recorder.isRecording {
                sampleRecorder?.stop()
                print("进入了停止函数:\(sampleRecorder?.isRecording)")
                let audioSession = AVAudioSession.sharedInstance()
                do {
                    try audioSession.setActive(false)
                } catch {
                    //
                }
//                isRecording = !isRecording
                print("停止")
            }
            
//     Set the audio recorder ready to record the next audio with a unique audioFileName
//           let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
//               FileManager.SearchPathDomainMask.userDomainMask).first // as! NSURL
//            trackTimes += 1
//            var audioFileURL = directoryURL!.appendingPathComponent(audioFileName2)
//            if trackTimes == 2 {
//                audioFileURL = directoryURL!.appendingPathComponent(audioFileName2)
//                print(audioFileURL)
//            } else if trackTimes == 3 {
//                audioFileURL = directoryURL!.appendingPathComponent(audioFileName3)
//                print(audioFileURL)
//            } else {
//                audioFileURL = directoryURL!.appendingPathComponent(audioFileName)
//                print(audioFileURL)
//            }
//
//           soundURL = audioFileName       // Sound URL to be stored in CoreData
//
//           // Setup audio session
//           let audioSession = AVAudioSession.sharedInstance()
//           do {
//               try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
//           } catch {
//               //
//           }
//
//           // Define the recorder setting
//           let recorderSetting = [AVFormatIDKey: NSNumber(value: kAudioFormatMPEG4AAC as UInt32),
//                                  AVSampleRateKey: 44100.0,
//                                  AVNumberOfChannelsKey: 2 ]
//
//            sampleRecorder = try? AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
//            sampleRecorder?.isMeteringEnabled = true
//            sampleRecorder?.prepareToRecord()
            
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        }
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
    
    func playThePotencial(filename: String, samplePlayer: AudioPlayer, engine: AudioEngine) {
        if let recorder = sampleRecorder {
           if !recorder.isRecording {
               avPlayer = try! AVAudioPlayer(contentsOf: getFileURL(filename: filename))
               print(getFileURL(filename: filename))

//               do {
//                   try engine.start()
//               } catch {
//                   //
//               }
//
//               do {
//                   try samplePlayer.load(url: getFileURL(filename: filename))
//                   samplePlayer.play()
//               } catch {
//                   //
//               }

               print("播放中")
               avPlayer.play()
           }
        }
    }
    
    func listeningStop() {
        avPlayer.stop()
    }
    
//    func saveSound() {
//        sampleRecorder.url
//    }

}
