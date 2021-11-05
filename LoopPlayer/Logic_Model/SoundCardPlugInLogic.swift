//
//  SoundCardPlugInLogic.swift
//  LoopPlayer
//
//  Created by Dan on 11/4/21.
//

import Foundation
import AudioKit
import AVFoundation
import SoundpipeAudioKit

class SoundCardPlugInLogic: ObservableObject {
    var engine = AudioEngine()
    var inputSession: AudioEngine.InputNode?
    var soundSession: AVAudioOutputNode?
    var rawMixer : Mixer
    var safeInputSingalData: AudioEngine.InputNode?
    var volum : Double = 0.5
    
    //DryWetMixer
    //delay
    var delay : Delay
    var delaySetting = DelaySetting()
    var delayMixer : DryWetMixer
    
    init(){
        if let engineInput = engine.input {
            inputSession = engineInput
            if let inputSignalData = inputSession {
                self.safeInputSingalData = inputSignalData
            }
        } else {
            safeInputSingalData = nil
//            engine.output = Mixer()
        }
        
        //delay
        self.rawMixer = Mixer(safeInputSingalData!)
        self.delay = Delay(safeInputSingalData!)
        self.delay.time = delaySetting.time
        self.delay.feedback = delaySetting.feedback
        self.delayMixer = DryWetMixer(rawMixer, delay, balance: 0.5)
        if safeInputSingalData != nil
        {
             engine.output = delayMixer
        } else {
            engine.output = Mixer()
        }
    }
    
    func changeDelay_balance(delay_balance: Double) {
        delayMixer.balance = AUValue(delay_balance)
    }
    
    func changeDelay_feedback(delay_feedback: Double) {
        delay.feedback = AUValue(delay_feedback)
    }
    
    func changeDelay_time(delay_time: Double) {
        delay.time = AUValue(delay_time)
    }
    
    func openSession() {
        do {
            try engine.start()
        } catch {
            //
        }
    }
    
    func stopSession() {
        engine.stop()
    }
}
