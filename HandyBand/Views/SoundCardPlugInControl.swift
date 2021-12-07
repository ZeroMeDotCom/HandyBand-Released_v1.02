//
//  SoundCardPlugInControl.swift
//  HandyBand
//
//  Created by Dan on 11/5/21.
// Who is this file?
    // Debug file - It's useful

//import SwiftUI
//
//struct SoundCardPlugInControl: View {
//    @State private var soundCardPlugIn: SoundCardPlugInLogic
//    //Delay
//    @State private var delay_balance : Double = 0.5
//    @State private var delay_feedback : Double = 0.5
//    @State private var delay_time : Double = 0.01
//    
//    init(soundCardPlugIn: SoundCardPlugInLogic){
//        self.soundCardPlugIn = soundCardPlugIn
//    }
//    var body: some View {
//        Slider(value: $delay_time, in: 0...1, onEditingChanged: {_ in
//            soundCardPlugIn.changeDelay_time(delay_time: $delay_time.wrappedValue)
//        })
//        Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
//            soundCardPlugIn.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue)
//        })
//        Slider(value: $delay_balance, in: 0...99, onEditingChanged: {_ in
//            soundCardPlugIn.changeDelay_balance(delay_balance: $delay_balance.wrappedValue)
//        })
//    }
//}
//
//struct SoundCardPlugInControl_Previews: PreviewProvider {
//    @StateObject var soundCardPlugIn = SoundCardPlugInLogic()
//
//    static var previews: some View {
//        SoundCardPlugInControl(soundCardPlugIn: SoundCardPlugInLogic)
//    }
//}
