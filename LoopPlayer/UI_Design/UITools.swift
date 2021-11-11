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
