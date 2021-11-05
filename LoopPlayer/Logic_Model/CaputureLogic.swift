//
//  CaputureLogic.swift
//  LoopPlayer
//
//  Created by Dan on 11/5/21.
//

import Foundation
import AVFoundation

class CaptureLogic: ObservableObject {
    private var audioRecorder: AVAudioRecorder
    private var timer: Timer?
    private var currentSample: Int
    private let numberOfSamples: Int
    
    @Published public var soundSamples: [Float]
    
    init(numberOfSamples: Int)
    {
        self.numberOfSamples = numberOfSamples
        self.soundSamples = [Float](repeating: .zero, count: numberOfSamples)
        self.currentSample = 0
        
        let audioSession = AVAudioSession.sharedInstance()
        if audioSession.recordPermission != .granted {
            audioSession.requestRecordPermission { (isGranted) in
                if !isGranted {
                    fatalError("Please allow recording setting...")
                }
            }
        }

        let url = URL(fileURLWithPath: "/dev/null", isDirectory: true)
        let recorderSettings: [String: Any] = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless),
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: url, settings: recorderSettings)
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
            
            startMonitoring()
        } catch {
            fatalError("something wrong")
        }
    }
        private func startMonitoring() {
            audioRecorder.isMeteringEnabled = true
            audioRecorder.record()
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (timer) in
                self.audioRecorder.updateMeters()
                self.soundSamples[self.currentSample] = self.audioRecorder.averagePower(forChannel: 0)
                self.currentSample = (self.currentSample + 1) % self.numberOfSamples
            })
        }
        
        deinit {
            timer?.invalidate()
            audioRecorder.stop()
        }

}
