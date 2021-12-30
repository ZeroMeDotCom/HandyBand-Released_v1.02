//
//  Track_Ten.swift
//  HandyBand
//
//  Created by Dan on 11/11/21.
//  Who is this file? -> Track 10

import SwiftUI
import AudioKit

struct Track_Ten: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @State private var selection: Int = 0
    @State private var selection_effect: Int = 0
    @State private var delay_balance : Double = 0.5
    @State private var delay_feedback : Double = 50
    @State private var delay_time : Double = 0.1
    @State private var saltMixerBalance : AUValue = 0.5
    @State private var volumeValue : Double = 50
    @State private var isOn: Bool = false
    @State private var convIsOpeningBoth: Bool = false
    @State private var convIsOpeningLeft: Bool = false
    @State private var convIsOpeningRight: Bool = false
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
                    fileManage.playNewButton(engine: fileManage.engine10, samplePlayer: fileManage.samplePlayer10, fileURL: fileManage.savedFileNames.fileNames["track10"]!["fileWay"]!)
                    self.isOn = true
                })
                .simultaneousGesture(TapGesture(count: 2).onEnded {
                    fileManage.stopSingleTrack(fileURL: fileManage.savedFileNames.fileNames["track10"]!["fileWay"]!, samplePlayer: fileManage.samplePlayer10, engine: fileManage.engine10)
                    self.isOn = false
                })
                    
                VStack {
                    //Send to Bus
                    Button(action: {
                        fileManage.addingToPlayNextTime(trackID: "track10") ? fileManage.setToEdit(trackID: "track10") : fileManage.setReady(trackID: "track10")
                        print(fileManage.whichToPlay)
                        
                    }, label: {
                        fileManage.addingToPlayNextTime(trackID: "track10") ?
                        Image(systemName: fileManage.sendToBusIconPressed )
                            .resizable()
                            .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                        :
                        Image(systemName: fileManage.sendToBusIcon)
                            .resizable()
                            .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                    })
                    // Track order
                    Image(systemName: "8.square")
                        .frame(width: SendToBusButtonH, height: SendToBusButtonH, alignment: .center)
                        .foregroundColor(TrackNumberColor)
                }

                
                
                VStack {
                    Slider(value: $volumeValue, in: 0...100, onEditingChanged: {_ in
                        fileManage.changeVolume(value: $volumeValue.wrappedValue, samplePlayer: fileManage.samplePlayer10)
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
                            fileManage.changeDelay_time(delay_time: $delay_time.wrappedValue, delay: fileManage.delay10)
                        })

                    }
                    .frame(alignment: .center)

                    HStack {
                        Image(systemName: DelayFeedbackIcon)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .center)

                        Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                            fileManage.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue, delay: fileManage.delay10)
                        })
                    }
                    HStack {
                        Image(systemName: DelayBalanceIcon)
                            .foregroundColor(EffectIconColor)
                            .frame(width: EffectIconH, height: EffectIconH, alignment: .center)

                        Slider(value: $delay_balance, in: 0...100, onEditingChanged: {_ in
                            fileManage.changeDelay_balance(delay_balance: $delay_balance.wrappedValue, dryWetMixer: fileManage.dryWetMixer10)
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
                            fileManage.changeDelay_balance(delay_balance: 0, dryWetMixer: fileManage.dryWetMixer10)
                            fileManage.change_reverb(place: places[newValue], reverb: fileManage.reverb10)
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
                        fileManage.changeConvolution_balance(convolution_balance: $saltMixerBalance.wrappedValue, saltMixer: fileManage.saltMixer10)
                        print("\($saltMixerBalance.wrappedValue)")
                    })
                    
                    HStack {
                        // Button - Left close/open
                        Button(action: {
                            self.convIsOpeningLeft = !self.convIsOpeningLeft
                            if self.convIsOpeningLeft {
                                fileManage.switchOnConvolutionLeftHalf(convolutionSalt_one: fileManage.convolutionSalt_one10, convolutionSalt_two: fileManage.convolutionSalt_two10)
                                self.convIsOpeningRight = false
                                self.convIsOpeningBoth = false
                            } else {
                                fileManage.switchffConvolutionLeftHalf(convolutionSalt_one: fileManage.convolutionSalt_one10, convolutionSalt_two: fileManage.convolutionSalt_two10)
                            }

                        }, label: {
                            self.convIsOpeningLeft ?
                            Image(systemName: LeftFlavor)
                                .foregroundColor(FlaborOpenColor)
                                .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
                            :
                            Image(systemName: LeftFlavor)
                                .foregroundColor(FlaborClosedColor)
                                .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
                        })
                        
                        Spacer()
                            .frame(width: FloverSpacerH, alignment: .center)
                        
                        // Button - Both close/open
                        Button(action: {
                            self.convIsOpeningBoth = !self.convIsOpeningBoth
                            if self.convIsOpeningBoth {
                                fileManage.switchOnConvolutionBoth(convolutionSalt_one: fileManage.convolutionSalt_one10, convolutionSalt_two: fileManage.convolutionSalt_two10)
                                self.convIsOpeningRight = false
                                self.convIsOpeningLeft = false
                            } else {
                                fileManage.switchffConvolutionBoth(convolutionSalt_one: fileManage.convolutionSalt_one10, convolutionSalt_two: fileManage.convolutionSalt_two10)
                            }

                        }, label: {
                            self.convIsOpeningBoth ?
                            Image(systemName: BothFlavorOpen)
                                .foregroundColor(FlaborOpenColor)
                                .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
                            :
                            Image(systemName: BothFlavorClose)
                                .foregroundColor(FlaborClosedColor)
                                .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
                        })
                        
                        Spacer()
                            .frame(width: FloverSpacerH, alignment: .center)
                        
                        // Button - Right close/open
                        Button(action: {
                            self.convIsOpeningRight = !self.convIsOpeningRight
                            if self.convIsOpeningBoth {
                                fileManage.switchOnConvolutionRightHalf(convolutionSalt_one: fileManage.convolutionSalt_one10, convolutionSalt_two: fileManage.convolutionSalt_two10)
                                self.convIsOpeningBoth = false
                                self.convIsOpeningLeft = false
                            } else {
                                fileManage.switchffConvolutionRightHalf(convolutionSalt_one: fileManage.convolutionSalt_one10, convolutionSalt_two: fileManage.convolutionSalt_two10)
                            }

                        }, label: {
                            self.convIsOpeningRight ?
                            Image(systemName: RightFlavor)
                                .foregroundColor(FlaborOpenColor)
                                .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
                            :
                            Image(systemName: RightFlavor)
                                .foregroundColor(FlaborClosedColor)
                                .frame(width: EffectIconH, height: EffectIconH, alignment: .center)
                        })
                    }
                    
                    
                }
                .frame( height: SegmentH, alignment: .center)


             
            }

        }

    }
}

struct Track_Ten_Previews: PreviewProvider {
    static var previews: some View {
        Track_Ten()
    }
}
