//
//  Track_Fourteen_PlugIn_Two.swift
//  HandyBand
//
//  Created by Dan on 11/15/21.
//Who is this file?
    // 1. Plug-in track 2 view

import SwiftUI
import AudioKit

struct Track_Fourteen_PlugIn_Two: View {
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
                    fileManage.playNewButton(engine: fileManage.engine14, samplePlayer: fileManage.samplePlayer14, fileURL: fileManage.savedFileNames.fileNames["track14"]!["fileWay"]!)
                    self.isOn = true
                })
                .simultaneousGesture(TapGesture(count: 2).onEnded {
                    fileManage.stopSingleTrack(fileURL: fileManage.savedFileNames.fileNames["track14"]!["fileWay"]!, samplePlayer: fileManage.samplePlayer14, engine: fileManage.engine14)
                    self.isOn = false
                })
                    
                VStack {
                    //Send to Bus
                    Button(action: {
                        fileManage.addingToPlayNextTime(trackID: "track14") ? fileManage.setToEdit(trackID: "track14") : fileManage.setReady(trackID: "track14")
                        print(fileManage.whichToPlay)
                        
                    }, label: {
                        fileManage.addingToPlayNextTime(trackID: "track14") ?
                        Image(systemName: fileManage.sendToBusIconPressed )
                            .resizable()
                            .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                        :
                        Image(systemName: fileManage.sendToBusIcon)
                            .resizable()
                            .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                    })
                    // Track order
                    Image(systemName: "14.square")
                        .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                        .foregroundColor(TrackNumberColor)
                }

                
                VStack {
                    Slider(value: $volumeValue, in: 0...100, onEditingChanged: {_ in
                        fileManage.changeVolume(value: $volumeValue.wrappedValue, samplePlayer: fileManage.samplePlayer14)
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
                    HStack {
                        Image(systemName: DelyTimeIcon)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .bottom)

                        
                        Slider(value: $delay_time, in: 0...10, onEditingChanged: {_ in
                            fileManage.changeDelay_time(delay_time: $delay_time.wrappedValue, delay: fileManage.delay14)
                        })

                    }
                    .frame(alignment: .center)

                    HStack {
                        Image(systemName: DelayFeedbackIcon)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .center)

                        Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                            fileManage.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue, delay: fileManage.delay14)
                        })
                    }
                    HStack {
                        Image(systemName: DelayBalanceIcon)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .center)

                        Slider(value: $delay_balance, in: 0...100, onEditingChanged: {_ in
                            fileManage.changeDelay_balance(delay_balance: $delay_balance.wrappedValue, dryWetMixer: fileManage.dryWetMixer14)
                        })
                    }


                }
                .frame( height: SegmentH, alignment: .center)

                
            } else if selection_effect == 1 {

                VStack {
                    HStack {
                        Image(systemName: DecorationIcon)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
                        Text("Try Anther Place")
                            .foregroundColor(EffectIconColor)
                        Image(systemName: DecorationIcon)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .center)

                    }
                    HStack
                    {
                        Image(systemName: InstructionIcon)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
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
                            fileManage.changeDelay_balance(delay_balance: 0, dryWetMixer: fileManage.dryWetMixer14)
                            fileManage.change_reverb(place: places[newValue], reverb: fileManage.reverb14)
                        })
                    }

                }
                .frame(height: SegmentH, alignment: .center)

     
            } else {
                VStack {
                    HStack {
                        Image(systemName: ConvolutionIconLeft)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
                        Text("Add Some Flavor")
                            .foregroundColor(EffectIconColor)
                        Image(systemName: ConvolutionIconRight)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .center)

                    }
                    Slider(value: $saltMixerBalance, in: 0...1, onEditingChanged: {_ in
                        fileManage.changeConvolution_balance(convolution_balance: $saltMixerBalance.wrappedValue, saltMixer: fileManage.saltMixer14)
                        print("\($saltMixerBalance.wrappedValue)")
                    })
                    
                    
                }
                .frame( height: SegmentH, alignment: .center)

             
            }

        }

    }
}

struct Track_Fourteen_PlugIn_Two_Previews: PreviewProvider {
    static var previews: some View {
        Track_Fourteen_PlugIn_Two()
    }
}
