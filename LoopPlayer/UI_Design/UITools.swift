//
//  UITools.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

import Foundation
import UIKit

//屏幕寬度
let screenW = UIScreen.main.bounds.width
//屏幕高度
let screenH = UIScreen.main.bounds.height
//控制區域大小
let controlPanW = (screenW - 20) //兩邊留 10
let controlPanH = (screenH / 16)
//四個組別的整體大小
let TrackWholeW = (screenW - 20)
let TrackWholeH = (screenH / 2)
//每個組別的大小
let TrackW = ((TrackWholeW - 10) / 2) // 中間留 10
let TrackH = ((TrackWholeH - 10 ) / 2) //中間留 10
//樂器整體大小
let InstrumentW = (screenW - 20)
let InstrumentH = (screenH / 3)
//鍵盤區域大小
let KeyboradW = (screenW - 20)
let KeyboradH = (screenH / 4)
//吉他音效調解大小
let GuitarEffectChangeW = ((screenW - 20) / 3)
let GuitarEffectChangeH = (screenH / 4)
//吉他介面預選項大小
let GuitarEffecPreW = ((screenW - 20) / 3)
let GuitarEffecPreH = (screenH / 4)
