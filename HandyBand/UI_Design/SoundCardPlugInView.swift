//
//  SoundCardPlugInView.swift
//  LoopPlayer
//
//  Created by Dan on 11/4/21.
// Who is this file?
    // 1. Plug-in(Guitar or bass) control
    // 2. Change the effects

import SwiftUI

struct SoundCardPlugInView: View {
    // Call SoundCardPlugInLogic class
    @StateObject var soundCardPlugIn = SoundCardPlugInLogic()
    // Data that comes from environment
    @EnvironmentObject var fileManage : FileManageLogic
    @EnvironmentObject var playCreationModel : playCreationsModel
    // Whether it's opened or not
    @State var stopFlag: Bool
    
    //Delay
    @State private var delay_balance : Double = 0.5
    @State private var delay_feedback : Double = 0.5
    @State private var delay_time : Double = 0.01
    
    init() {
        self.stopFlag = true
    }
    var body: some View {
        HStack {
            // Effect setting area
//            VStack {
//                VStack(alignment: .leading) {
//                    HStack {
//                        Text("Guitar").foregroundColor(.yellow)
//                        Image(systemName: "guitars").foregroundColor(.yellow)
//                    }
//                    PlaySampleGuitarGroup()
//                        .environmentObject(fileManage)
//                        .environmentObject(playCreationModel)
//                }
//                .frame(width: TrackW, alignment: .center)
//
//        }

            VStack {
                // Open / Close Plug-in signal
                HStack {
                    Text("Session!!")
                    Button(action: {
                        self.stopFlag ? self.soundCardPlugIn.stopSession() : self.soundCardPlugIn.openSession()
                        self.stopFlag = !self.stopFlag
                        
                    }, label: {
                        Image(systemName: self.stopFlag ? "powerplug.fill" : "powerplug")
                    })
                }
                
                //delay control
                VStack {
                    Slider(value: $delay_time, in: 0...1, onEditingChanged: {_ in
                        soundCardPlugIn.changeDelay_time(delay_time: $delay_time.wrappedValue)
                    })
                    Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                        soundCardPlugIn.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue)
                    })
                    Slider(value: $delay_balance, in: 0...99, onEditingChanged: {_ in
                        soundCardPlugIn.changeDelay_balance(delay_balance: $delay_balance.wrappedValue)
                    })
                }
            }
            .frame(width: GuitarEffectChangeW, alignment: .center)

        }

    }
}

struct SoundCardPlugInView_Previews: PreviewProvider {
    static var previews: some View {
        SoundCardPlugInView()
    }
}
