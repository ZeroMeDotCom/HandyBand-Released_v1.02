//
//  NewStylePlayButton.swift
//  LoopPlayer
//
//  Created by Dan on 11/11/21.
// Who's this file?
    // Model for Track view

import SwiftUI
import AudioKit

struct TrackPlayControl_MODEL: View {
    // Data that comes from enviroment
    @EnvironmentObject var fileManage : FileManageLogic
    
    // Data that is used within this view 
    @State private var selection: Int = 0
    @State private var delay_balance : Double = 0.5
    @State private var delay_feedback : Double = 50
    @State private var delay_time : Double = 0.1
    @State private var saltMixerBalance : AUValue = 0.5
    @State private var isOn: Bool = false

    var body: some View {
        VStack {
            // Play button
            Button(action: {
                //
            }, label: {
                self.isOn ?
                Image(systemName: PlayButtonImagePressed)
                    .resizable()
                    .frame(width: PlayButtonSizeH, height: PlayButtonSizeH, alignment: .center)
                    .foregroundColor(PlayButtonColor)
                :
                Image(systemName: PlayButtonImage)
                    .resizable()
                    .frame(width: PlayButtonSizeH, height: PlayButtonSizeH, alignment: .center)
                    .foregroundColor(PlayButtonColor)

            })
            .gesture(TapGesture(count: 1).onEnded {
                fileManage.playNewButton(engine: fileManage.engine3, samplePlayer: fileManage.samplePlayer3, fileURL: fileManage.savedFileNames.fileNames["track3"]!["fileWay"]!)
                self.isOn = true
            })
            .simultaneousGesture(TapGesture(count: 2).onEnded {
                fileManage.stopSingleTrack(fileURL: fileManage.savedFileNames.fileNames["track3"]!["fileWay"]!, samplePlayer: fileManage.samplePlayer3, engine: fileManage.engine3)
                self.isOn = false
            })
            
            // Delay Setting slider
            Slider(value: $delay_time, in: 0...10, onEditingChanged: {_ in
                fileManage.changeDelay_time(delay_time: $delay_time.wrappedValue, delay: fileManage.delay1)
            })
        
            Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                fileManage.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue, delay: fileManage.delay1)
            })
            Slider(value: $delay_balance, in: 0...100, onEditingChanged: {_ in
                fileManage.changeDelay_balance(delay_balance: $delay_balance.wrappedValue, dryWetMixer: fileManage.dryWetMixer1)
            })
            
            // Reverb picker
            Picker(selection: self.$selection, label: myPickerStyleLabel()) {
                Text("cathedral").tag(0)
                Text("largeHall").tag(1)
                Text("largeHall2").tag(2)
                Text("largeRoom").tag(3)
                Text("mediumChamber").tag(4)

            }
            .pickerStyle(.menu)
            .onChange(of: selection, perform: {
                newValue in
    //            print("Selected Unit: \(places[newValue])", "Selected Index: \(newValue)")
                fileManage.changeDelay_balance(delay_balance: 0, dryWetMixer: fileManage.dryWetMixer1)
                fileManage.change_reverb(place: places[newValue], reverb: fileManage.reverb1)
            })
            
            // Convolution slider
            Slider(value: $saltMixerBalance, in: 0...1, onEditingChanged: {_ in
                fileManage.changeConvolution_balance(convolution_balance: $saltMixerBalance.wrappedValue, saltMixer: fileManage.saltMixer1)
                print("\($saltMixerBalance.wrappedValue)")
            })
        }

    }
}


struct myPickerStyleLabel: View {
    var body: some View {
        Text("Reverb")
    }
}
    
    
struct NewStylePlayButton_Previews: PreviewProvider {
    static var previews: some View {
        TrackPlayControl_MODEL()
    }
}
