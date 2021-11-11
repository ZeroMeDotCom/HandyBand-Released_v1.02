//
//  UITools.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
// Who is the file?
    // frame setting
    // position setting
    // Height, width setting

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
//keyboard area
let KeyboradW = (screenW - 20)
let KeyboradH = (screenH / 4)
//plug-in setting area
let GuitarEffectChangeW = ((screenW - 20) / 3)
let GuitarEffectChangeH = (screenH / 4)
//plug-in effect preview area
let GuitarEffecPreW = ((screenW - 20) / 3)
let GuitarEffecPreH = (screenH / 4)


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

//Single Track Group Specer
let SingleTrackGroupSpecerH = screenW / 63
let SingleTrackGroupSpecerBottomH = screenH / 63
