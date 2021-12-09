//
//  SoundCardPlugInView.swift
//  HandyBand
//
//  Created by Dan on 11/4/21.
// Who is this file?
    // 1. Plug-in(Guitar or bass) control
    // 2. Change the effects

import SwiftUI
import AudioToolbox

struct SoundCardPlugInView: View {
    // Call SoundCardPlugInLogic class
    @StateObject var soundCardPlugIn = SoundCardPlugInLogic()
    // Data that comes from environment
    @EnvironmentObject var fileManage : FileManageLogic
    @EnvironmentObject var playCreationModel : playCreationsModel
    // Whether it's opened or not
    @State var plugInFlag: Bool = false
    // Whether the Reset button pressed or not
    @State var resetButtonPressed: Bool = false
    // Picker selection
    @State private var pickerSelection = 1
    // Default Effects Selection
    @State private var defaultEffectSelection: String?
    
    //Delay
    @State private var delay_feedback : Double = 0.0
    @State private var delay_time : Double = 0.0
    
    //Wah
    @State private var wah_Value: AUValue = 0.0
    @State private var wah_Mix: AUValue = 0.0
    @State private var wah_Amplitude: AUValue = 0.0
    
    //Chorus
    @State private var chorus_Frequency: AUValue = 0.0
    @State private var chorus_Depth: AUValue = 0.0
    @State private var chorus_Feedback: AUValue = 0.0
    
    init() {
        self.plugInFlag = false
        self.resetButtonPressed = false
    }
    var body: some View {
        HStack {

            // Preview effects are
            List {
                Button(action: {
                    self.changeToOcean()
                }, label: {
                    Text("The Ocean")
                })
                Button(action: {
                    
                }, label: {
                    Text("Deep Breath")
                })
                Button(action: {
                    
                }, label: {
                    Text("Jack Chen")
                })
                Button(action: {
                    
                }, label: {
                    Text("Kirk Hammet")
                })
                Button(action: {
                    
                }, label: {
                    Text("Chi-La-He-CHi-La")
                })
                
            }
            .frame(width: GuitarEffecPreW, height: GuitarEffecPreH, alignment: .center)
            
            // Effect control area
            VStack {

                HStack {
                    // Reset effects button
                    Button(action: {
                        self.reset()
                    }, label: {
                        Image(systemName: self.resetButtonPressed ? EffectRestPressedIcon : EffectRestIcon)
                    })
                        .onLongPressGesture(perform: {
                            //
                        }, onPressingChanged: { pressing in
                            if pressing {
                                resetButtonPressed = true
                            } else {
                                resetButtonPressed = false
                            }
                        })
                    
                    // Open / Close Plug-in signal
                    Button(action: {
                        self.plugInFlag = !self.plugInFlag
                        self.plugInFlag ? self.soundCardPlugIn.openSession() : self.soundCardPlugIn.stopSession()
                        
                    }, label: {
                        Image(systemName: self.plugInFlag ? PlugInOpenIcon : PlugInIcon)
                    })
                }
                
                // Effect controller picker
                Picker(selection: $pickerSelection, label: Text("effects")) {
                    Text("delay").tag(0)
                    Text("wah").tag(1)
                    Text("chorus").tag(2)
                }.pickerStyle(.segmented)
                if pickerSelection == 0 {
                    //Two delay sliders
                    VStack {
                        HStack {
                            Image(systemName: DelyTimeIcon)
                                .foregroundColor(FlaborOpenColor)
                            Slider(value: $delay_time, in: 0...1, onEditingChanged: {_ in
                                soundCardPlugIn.changeDelay_time(delay_time: $delay_time.wrappedValue)
                            })
                        }
                        HStack {
                            Image(systemName: DelayFeedbackIcon)
                                .foregroundColor(FlaborOpenColor)
                            Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                                soundCardPlugIn.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue)
                            })
                        }
                    }
                    .frame(height: EffectsSliderH, alignment: .center)
                } else if pickerSelection == 1 {
                    //Three wah sliders
                    VStack {
                        HStack {
                            Image(systemName: WahValueIcon)
                                .foregroundColor(FlaborOpenColor)
                            Slider(value: $wah_Value, in: 0...100, onEditingChanged: {_ in
                                soundCardPlugIn.changeWah_wahValue(wah_value: Double($wah_Value.wrappedValue))
                            })
                        }
                        HStack {
                            Image(systemName: WahMixIcon)
                                .foregroundColor(FlaborOpenColor)
                            Slider(value: $wah_Mix, in: 0...100, onEditingChanged: {_ in
                                soundCardPlugIn.changeWah_mix(wah_mix: Double($wah_Mix.wrappedValue))
                            })
                        }
                        HStack {
                            Image(systemName: WahAmplitudeIcon)
                                .foregroundColor(FlaborOpenColor)
                            Slider(value: $wah_Amplitude, in: 0...100, onEditingChanged: {_ in
                                soundCardPlugIn.changeWah_amplitude(wah_amplitude: Double($wah_Amplitude.wrappedValue))
                            })
                        }

                    }
                    .frame(height: EffectsSliderH, alignment: .center)
                } else if pickerSelection == 2 {
                    //Three chorus sliders
                    VStack {
                        HStack {
                            Image(systemName: ChorusFrequencyIcon)
                                .foregroundColor(FlaborOpenColor)
                            Slider(value: $chorus_Frequency, in: 0...100, onEditingChanged: {_ in
                                soundCardPlugIn.changeChorus_frequency(chorus_frequency: Double($chorus_Frequency.wrappedValue))
                            })
                        }
                        HStack {
                            Image(systemName: ChorusDepthIcon)
                                .foregroundColor(FlaborOpenColor)
                            Slider(value: $chorus_Depth, in: 0...100, onEditingChanged: {_ in
                                soundCardPlugIn.changeChorus_depth(chorus_depth: Double($chorus_Depth.wrappedValue))
                            })
                        }
                        HStack {
                            Image(systemName: ChorusFeedbackIcon)
                                .foregroundColor(FlaborOpenColor)
                            Slider(value: $chorus_Feedback, in: 0...100, onEditingChanged: {_ in
                                soundCardPlugIn.changeChorus_feedback(chorus_feedback: Double($chorus_Feedback.wrappedValue))
                            })
                        }
                    }
                    .frame(height: EffectsSliderH, alignment: .center)
                }
               
            }
            .frame(width: GuitarEffectChangeW, alignment: .center)

        }

    }
    
    func changeToOcean() {
        self.delay_feedback = 0.1
        self.delay_time = 0.1
        self.wah_Value = 10
        self.wah_Mix = 10
        self.wah_Amplitude = 5
        self.chorus_Frequency = 60
        self.chorus_Depth = 80
        self.chorus_Feedback = 10
    }
    
    func reset() {
        self.delay_feedback = 0.0
        self.delay_time = 0.0
        
        self.wah_Value = 0.0
        self.wah_Mix = 0.0
        self.wah_Amplitude = 0.0
        
        self.chorus_Frequency = 0.0
        self.chorus_Depth = 0.0
        self.chorus_Feedback = 0.0
    }
}

struct SoundCardPlugInView_Previews: PreviewProvider {
    static var previews: some View {
        SoundCardPlugInView()
    }
}
