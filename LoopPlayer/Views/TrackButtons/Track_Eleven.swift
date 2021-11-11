//
//  Track_Eleven.swift
//  LoopPlayer
//
//  Created by Dan on 11/11/21.
// Who is this file? -> Track 11

import SwiftUI
import AudioKit

struct Track_Eleven: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @State private var selection: Int = 0
    @State private var selection_effect: Int = 0
    @State private var delay_balance : Double = 0.5
    @State private var delay_feedback : Double = 50
    @State private var delay_time : Double = 0.1
    @State private var saltMixerBalance : AUValue = 0.5
    var body: some View {
        VStack {
            HStack {
                Button("T") {
                    fileManage.playNewButton(engine: fileManage.engine11, samplePlayer: fileManage.samplePlayer11, fileURL: fileManage.savedFileNames.fileNames["track11"]!["fileWay"]!)
                }
                .buttonStyle(MyButtonStyle2(color: .yellow))
                .clipShape(Circle())
                
                Button(action: {
                    fileManage.addingToPlayNextTime(trackID: "track11") ? fileManage.setToEdit(trackID: "track11") : fileManage.setReady(trackID: "track11")
                    print(fileManage.whichToPlay)
                    
                }, label: {
                    fileManage.addingToPlayNextTime(trackID: "track11") ?
                    Image(systemName: fileManage.sendToBusIconPressed)
                        .resizable()
                        .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                    :
                    Image(systemName: fileManage.sendToBusIcon)
                        .resizable()
                        .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                })
            }

            Picker(selection: self.$selection_effect, label: myPickerStyleLabel()) {
                Text("Delay").tag(0)
                Text("Reverb").tag(1)
                Text("Conv").tag(2)
            }.pickerStyle(.segmented)
            if selection_effect == 0 {
                
                //Delay Setting
                Slider(value: $delay_time, in: 0...10, onEditingChanged: {_ in
                    fileManage.changeDelay_time(delay_time: $delay_time.wrappedValue, delay: fileManage.delay11)
                })
            
                Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                    fileManage.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue, delay: fileManage.delay11)
                })
                Slider(value: $delay_balance, in: 0...100, onEditingChanged: {_ in
                    fileManage.changeDelay_balance(delay_balance: $delay_balance.wrappedValue, dryWetMixer: fileManage.dryWetMixer11)
                })
                
            } else if selection_effect == 1 {
                
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
                    fileManage.changeDelay_balance(delay_balance: 0, dryWetMixer: fileManage.dryWetMixer11)
                    fileManage.change_reverb(place: places[newValue], reverb: fileManage.reverb11)
                })
     
            } else {
                
                Slider(value: $saltMixerBalance, in: 0...1, onEditingChanged: {_ in
                    fileManage.changeConvolution_balance(convolution_balance: $saltMixerBalance.wrappedValue, saltMixer: fileManage.saltMixer11)
                    print("\($saltMixerBalance.wrappedValue)")
                })
             
            }

        }
    }
}

struct Track_Eleven_Previews: PreviewProvider {
    static var previews: some View {
        Track_Eleven()
    }
}
