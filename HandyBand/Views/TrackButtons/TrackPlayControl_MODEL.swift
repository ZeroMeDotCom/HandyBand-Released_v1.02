//
//  TrackPlayControl_MODEL.swift
//  HandyBand
//
//  Created by Dan on 11/11/21.
// Who's this file?
    // Model for Track view

import SwiftUI
import AudioKit

struct TrackPlayControl_MODEL: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @State private var selection: Int = 0
    @State private var selection_effect: Int = 0
    @State private var delay_balance : Double = 0.5
    @State private var delay_feedback : Double = 50
    @State private var delay_time : Double = 0.1
    @State private var saltMixerBalance : AUValue = 0.5
    @State private var volumeValue : Double = 50
    @State private var isOn: Bool = false
    var body: some View {
        VStack {
            HStack {
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
                    

                //Send to Bus
                Button(action: {
                    fileManage.addingToPlayNextTime(trackID: "track3") ? fileManage.setToEdit(trackID: "track3") : fileManage.setReady(trackID: "track3")
                    print(fileManage.whichToPlay)
                    
                }, label: {
                    fileManage.addingToPlayNextTime(trackID: "track3") ?
                    Image(systemName: fileManage.sendToBusIconPressed )
                        .resizable()
                        .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                    :
                    Image(systemName: fileManage.sendToBusIcon)
                        .resizable()
                        .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                })
                
                VStack {
                    Slider(value: $volumeValue, in: 0...100, onEditingChanged: {_ in
                        fileManage.changeVolume(value: $volumeValue.wrappedValue, samplePlayer: fileManage.samplePlayer3)
                    })
                        .rotationEffect(.degrees(-90))
                        .frame(width: TrackVolumeSizeH, height: TrackVolumeSizeH , alignment: .topLeading)
                    
                    Image(systemName: "speaker.wave.2.fill")
                        .foregroundColor(EffectIconColor)
                        .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
                        .padding(.top, -EffectIconH * 1.5)
                }

            }
            
            
            Picker(selection: self.$selection_effect, label: myPickerStyleLabel()) {
                Text("Delay").tag(0)
                Text("Reverb").tag(1)
                Text("Conv").tag(2)
            }.pickerStyle(.segmented)
            if selection_effect == 0 {
                VStack {
                    //Delay Setting
                    Slider(value: $delay_time, in: 0...10, onEditingChanged: {_ in
                        fileManage.changeDelay_time(delay_time: $delay_time.wrappedValue, delay: fileManage.delay3)
                    })
                
                    Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                        fileManage.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue, delay: fileManage.delay3)
                    })
                    Slider(value: $delay_balance, in: 0...100, onEditingChanged: {_ in
                        fileManage.changeDelay_balance(delay_balance: $delay_balance.wrappedValue, dryWetMixer: fileManage.dryWetMixer3)
                    })
                }
                .frame( height: SegmentH, alignment: .center)
                .border(.red, width: 3)

                
            } else if selection_effect == 1 {

                VStack {
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
                        fileManage.changeDelay_balance(delay_balance: 0, dryWetMixer: fileManage.dryWetMixer3)
                        fileManage.change_reverb(place: places[newValue], reverb: fileManage.reverb3)
                    })
                }
                .frame( height: SegmentH, alignment: .center)
                .border(.red, width: 3)

     
            } else {
                VStack {
                    Slider(value: $saltMixerBalance, in: 0...1, onEditingChanged: {_ in
                        fileManage.changeConvolution_balance(convolution_balance: $saltMixerBalance.wrappedValue, saltMixer: fileManage.saltMixer3)
                        print("\($saltMixerBalance.wrappedValue)")
                    })
                }
                .frame( height: SegmentH, alignment: .center)
                .border(.red, width: 3)

             
            }

        }

    }
}

struct TrackPlayControl_MODEL_Previews: PreviewProvider {
    static var previews: some View {
        Track_Three()
    }
}
