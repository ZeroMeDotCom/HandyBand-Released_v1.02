//
//  PlayCreationsModel.swift
//  LoopPlayer
//
//  Created by Dan on 11/10/21.
//  Who is this file?
    // 1. which file to play
    // 2. loop or not
    // 3. Future plan: how to play based on Live version

import Foundation
import AudioKit

class playCreationsModel: ObservableObject {
    @Published var whichToPlay: [Bool] = [true, false, false, false, false, false, false, false, false, false, false, false, false, true]
    private var trackID : String = ""
    func setReady(trackID: String) {
        self.trackID = trackID
        switch self.trackID {
        case "track1":
            whichToPlay[1] = true
//            return whichToPlay[1]
        case "track2":
            whichToPlay[2] = true
//            return whichToPlay[2]
        case "track3":
            whichToPlay[3] = true
//            return whichToPlay[3]
        case "track4":
            whichToPlay[4] = true
//            return whichToPlay[4]
        case "track5":
            whichToPlay[5] = true
//            return whichToPlay[5]
        case "track6":
            whichToPlay[6] = true
//            return whichToPlay[6]
        case "track7":
            whichToPlay[7] = true
//            return whichToPlay[7]
        case "track8":
            whichToPlay[8] = true
//            return whichToPlay[8]
        case "track9":
            whichToPlay[9] = true
//            return whichToPlay[9]
        case "track10":
            whichToPlay[10] = true
//            return whichToPlay[10]
        case "track11":
            whichToPlay[11] = true
//            return whichToPlay[11]
        case "track12":
            whichToPlay[12] = true
//            return whichToPlay[12]
        default:
            whichToPlay[13] = false
//            return whichToPlay[13]
        }
    }
}
