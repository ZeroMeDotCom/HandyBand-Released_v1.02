//
//  SoundCardPlugInLogic.swift
//  HandyBand
//
//  Created by Dan on 11/4/21.
// Who's this file?
    // 1. Manage the plug-in
    // 2. Change the effects of plug-in sign

import Foundation
import AudioKit
import AVFoundation
import SoundpipeAudioKit
import DunneAudioKit

class SoundCardPlugInLogic: ObservableObject {
    //Engine, input handler, mixer
    var engine = AudioEngine()
    var inputSession: AudioEngine.InputNode?
    var soundSession: AVAudioOutputNode?
//    var rawMixer : Mixer
    var safeInputSingalData: AudioEngine.InputNode?
    var volum : Double = 0.5
    
    //Mixer settings
    //1.delay
    var delay : Delay
    var delaySetting = DelaySetting()
//    var delayMixer : Mixer
    
    //2.wah
    var wah: AutoWah
    var wahValue: AUValue = 0.0
    var wahMix: AUValue = 0.0
    var wahAmplitude: AUValue = 0.0
    var wahRampDuration: AUValue = 0.01
//    var wahMixer: Mixer
    
    //3.chorus
    var chorus: Chorus
    var chorusFrequency: AUValue = 0.0
    var chorusDepth: AUValue = 0.0
    var chorusFeedback: AUValue = 0.0
    var chorusRampDuration: AUValue = 0.01
    
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
        
        //Raw
//        self.rawMixer = Mixer(safeInputSingalData!)
        
        //Delay
        self.delay = Delay(safeInputSingalData!)
        self.delay.time = delaySetting.time
        self.delay.feedback = delaySetting.feedback
//        self.delayMixer = Mixer(rawMixer, delay)
        
        //Wah
        self.wah = AutoWah(delay)
        
        //Chorus
        self.chorus = Chorus(wah)
        
        if safeInputSingalData != nil
        {
             engine.output = chorus
        } else {
            engine.output = Mixer()
        }
    }
    //Two chorus settings
    func changeChorus_frequency(chorus_frequency: Double) {
        chorus.$frequency.ramp(to: AUValue(chorus_frequency), duration: self.chorusRampDuration)
    }
    func changeChorus_depth(chorus_depth: Double) {
        chorus.$depth.ramp(to: AUValue(chorus_depth), duration: self.chorusRampDuration)
    }
    func changeChorus_feedback(chorus_feedback: Double) {
        chorus.$feedback.ramp(to: AUValue(chorus_feedback), duration: self.chorusRampDuration)
    }
    //Three wah settings
    func changeWah_wahValue(wah_value: Double) {
        wah.$wah.ramp(to: AUValue(wah_value), duration: self.wahRampDuration)
    }
    func changeWah_mix(wah_mix: Double) {
        wah.$mix.ramp(to: AUValue(wah_mix), duration: self.wahRampDuration)
    }
    func changeWah_amplitude(wah_amplitude: Double) {
        wah.$amplitude.ramp(to: AUValue(wah_amplitude), duration: self.wahRampDuration)
    }
    //Two delay settings
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
