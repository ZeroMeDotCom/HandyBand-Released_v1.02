//
//  UITools.swift
//  HandyBand
//
//  Created by Dan on 11/6/21.
// Who is the file?
    // frame setting
    // position setting
    // Height, width setting
    // Image, Icon setting - All the images/Icons(string name are all provided by Apple Inc) are created by Apple Inc. and it's free to use

import Foundation
import UIKit
import SwiftUI

//Screen Width
let screenW = UIScreen.main.bounds.width
//Screen Height
let screenH = UIScreen.main.bounds.height
//Control area
let controlPanW = (screenW - 20) // 10 at each side
let controlPanH = (screenH / 16)
//4 Groups
let TrackWholeW = (screenW - 20)
let TrackWholeH = (screenH / 2)
// Each Track Group
let TrackW = ((TrackWholeW - 10) / 2) // 10 in the middle
let TrackH = ((TrackWholeH - 10 ) / 2) // 10 in the middle
//Instrument area
let InstrumentW = (screenW - 20)
let InstrumentH = (screenH / 3)
let TopSpacerH = (InstrumentH / 20)
let ColumeSpacerW = (InstrumentW / 60)
let MoveAreaW = (InstrumentW - ColumeSpacerW * 2)
let MoveAreaH = (InstrumentH * 6 / 8)
let DrumColor = SwiftUI.Color.cyan
let BassColor = SwiftUI.Color.yellow
let StringColor = SwiftUI.Color.blue
let PianoColor = SwiftUI.Color.purple
//keyboard area
let KeyboradW = (screenW - 20)
let KeyboradH = (screenH / 4)
//plug-in setting area
let GuitarEffectChangeW = (((screenW - 20) - TrackW - ColumeSpacerW * 2) / 2)
let GuitarEffectChangeH = (screenH / 4)
//plug-in effect preview area
let GuitarEffecPreW = (((screenW - 20) - TrackW - ColumeSpacerW * 2) / 2)
let GuitarEffecPreH = (screenH / 4)
let EffectsSliderH = ((GuitarEffecPreH * 3) / 5)
let EffectRestIcon : String = "r.circle"
let EffectRestPressedIcon : String = "r.circle.fill"
let PlugInIcon : String = "powerplug"
let PlugInOpenIcon : String = "powerplug.fill"
let WahValueIcon: String = "scribble.variable"
let WahMixIcon: String = "square.stack.3d.down.right"
let WahAmplitudeIcon: String = "lasso"
let ChorusDepthIcon: String = "square.stack.3d.up"
let ChorusFrequencyIcon: String = "skew"
let ChorusFeedbackIcon: String = "arrow.backward"
// Recording Button
let ReocordingButtonH = controlPanH / 2.5
// Stepper - BPM & Counter
let StepperH = controlPanW / 8
// Control Spacer configration
let ControlSpacerH = controlPanW / 16
// Color theme
let BackgroundColor = Color(red: 244 / 255, green: 244 / 255, blue: 244 / 255)
let PlayerBorderColor = SwiftUI.Color.purple
// Send to bus button size
let SendToBusButtonH = controlPanH / 2.5
//Play Button
let PlayButtonColor = SwiftUI.Color.yellow
let PlayButtonImage:String = "play.circle"
let PlayButtonImagePressed:String = "stop.circle.fill"
let PlayButtonSizeH = controlPanH
//Single Track
let SingleTrackGroupSpecerH = screenW / 63
let SingleTrackGroupSpecerBottomH = screenH / 63
let SegmentH = (TrackH * 2 / 5)
let singleTrackW = ((TrackW - SingleTrackGroupSpecerH * 3) / 3)
//Effects icon color
let EffectIconColor = SwiftUI.Color.purple
let EffectIconH = (PlayButtonSizeH / 6)
//Volumee size
let TrackVolumeSizeH = controlPanH
//Dely
let DelyTimeIcon: String = "timer"
let DelayFeedbackIcon: String = "arrow.uturn.backward"
let DelayBalanceIcon: String = "equal"
//Convolution
let ConvolutionIconLeft:String = "signpost.left"
let ConvolutionIconRight:String = "signpost.right"
let LeftFlavor: String = "circle.lefthalf.filled"
let RightFlavor: String = "circle.righthalf.filled"
let BothFlavorClose: String = "circle"
let BothFlavorOpen: String = "circle.fill"
let FlaborClosedColor = SwiftUI.Color.black
let FlaborOpenColor = SwiftUI.Color.purple
let FloverSpacerH = EffectIconH * 2
//Reverb
let InstructionIcon: String = "hand.point.right"
let DecorationIcon: String = "circle.dotted"
//Track number
let TrackNumberColor = SwiftUI.Color.pink
//Info
let InfoIcon: String = "info.circle"
let InfoIconPressed: String = "info.circle.fill"
let InfoIconColor = SwiftUI.Color.gray
let InfoWebsite: String = "https://teresonmusic.com/2021/11/23/handle-band/" // The website created and published by Dan.


