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
    @Published var engine = AudioEngine()
    @Published var samplePlayer = AudioPlayer()
    @Published var engine2 = AudioEngine()
    @Published var samplePlayer2 = AudioPlayer()
    @Published var engine3 = AudioEngine()
    @Published var samplePlayer3 = AudioPlayer()
    
    @Published var isRecording: Bool = false
    @Published var isListening: Bool = false
    
    var avPlayer = AVAudioPlayer()
    var url: URL?
    var path: String?
    var filename: String = ""
    var trackTimes = 1
    
    var saveFileNames : [String : String] = [
        "track1" : "",
        "track2" : "",
    ]
    
    var audioFileName = "track1" + ".m4a"
    var audioFileName2 = "track2" + ".m4a"
    var audioFileName3 = "track3" + ".m4a"
    
    private var sampleRecorder: AVAudioRecorder?
    var audioSession = AVAudioSession.sharedInstance()
    var soundURL : String = ""
    
    init() {
        engine.output = samplePlayer
        engine2.output = samplePlayer2
        engine3.output = samplePlayer3
        
        // Set the audio file
         let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
             FileManager.SearchPathDomainMask.userDomainMask).first
         
         let audioFileURL = directoryURL!.appendingPathComponent(audioFileName)
        print(audioFileURL)
         soundURL = audioFileName       // Sound URL to be stored in CoreData
         
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
    }
    
    func startRecording() {
        if let recorder = sampleRecorder {
            if !recorder.isRecording {
                let audioSession = AVAudioSession.sharedInstance()
                
                do {
                    try audioSession.setActive(true)
                } catch {
                    //
                }
                
                // Start recording
                recorder.record()
            }
        }
    }
    
    func stopRecording() {
        if let recorder = sampleRecorder {
            if recorder.isRecording {
                sampleRecorder?.stop()
                let audioSession = AVAudioSession.sharedInstance()
                do {
                    try audioSession.setActive(false)
                } catch {
                    //
                }
            }
            
//     Set the audio recorder ready to record the next audio with a unique audioFileName
           let directoryURL = FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in:
               FileManager.SearchPathDomainMask.userDomainMask).first // as! NSURL
            trackTimes += 1
            var audioFileURL = directoryURL!.appendingPathComponent(audioFileName2)
            if trackTimes == 2 {
                audioFileURL = directoryURL!.appendingPathComponent(audioFileName2)
                print(audioFileURL)
            } else if trackTimes == 3 {
                audioFileURL = directoryURL!.appendingPathComponent(audioFileName3)
                print(audioFileURL)
            } else {
                audioFileURL = directoryURL!.appendingPathComponent(audioFileName)
                print(audioFileURL)
            }

           soundURL = audioFileName       // Sound URL to be stored in CoreData

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

            sampleRecorder = try? AVAudioRecorder(url: audioFileURL, settings: recorderSetting)
            sampleRecorder?.isMeteringEnabled = true
            sampleRecorder?.prepareToRecord()
            
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
