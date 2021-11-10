//
//  Track_Two.swift
//  LoopPlayer
//
//  Created by Dan on 11/11/21.
//

import SwiftUI
import AudioKit

struct Track_Two: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @State private var selection: Int = 0
    @State private var delay_balance : Double = 0.5
    @State private var delay_feedback : Double = 50
    @State private var delay_time : Double = 0.1
    @State private var saltMixerBalance : AUValue = 0.5
    var body: some View {
        VStack {
            Button("T") {
                fileManage.playNewButton(engine: fileManage.engine2, samplePlayer: fileManage.samplePlayer2)
            }
            .buttonStyle(MyButtonStyle2(color: .gray))
            .clipShape(Circle())
            
            //Delay Setting
            Slider(value: $delay_time, in: 0...10, onEditingChanged: {_ in
                fileManage.changeDelay_time(delay_time: $delay_time.wrappedValue, delay: fileManage.delay2)
            })
        
            Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                fileManage.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue, delay: fileManage.delay2)
            })
            Slider(value: $delay_balance, in: 0...100, onEditingChanged: {_ in
                fileManage.changeDelay_balance(delay_balance: $delay_balance.wrappedValue, dryWetMixer: fileManage.dryWetMixer2)
            })
            
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
                fileManage.changeDelay_balance(delay_balance: 0, dryWetMixer: fileManage.dryWetMixer2)
                fileManage.change_reverb(place: places[newValue], reverb: fileManage.reverb2)
            })
            
            Slider(value: $saltMixerBalance, in: 0...1, onEditingChanged: {_ in
                fileManage.changeConvolution_balance(convolution_balance: $saltMixerBalance.wrappedValue, saltMixer: fileManage.saltMixer2)
                print("\($saltMixerBalance.wrappedValue)")
            })
        }
    }
}

struct Track_Two_Previews: PreviewProvider {
    static var previews: some View {
        Track_Two()
    }
}
