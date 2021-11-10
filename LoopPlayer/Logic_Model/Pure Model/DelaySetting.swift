//
//  DelaySetting.swift
//  LoopPlayer
//
//  Created by Dan on 10/30/21.
//

import Foundation
import AudioKit

struct DelaySetting {
    
    // 0.01 ~ 0.5 is enough for this project
    var time : AUValue = 0.5
    
    // 0 ~ 1 is enough
    var balance : AUValue = 0.5
    
    // 0 ~ 0.9 is ok for this project
    var feedback : AUValue = 50
}
