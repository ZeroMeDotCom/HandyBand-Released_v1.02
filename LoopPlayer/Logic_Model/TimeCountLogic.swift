//
//  TimeCountLogic.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

import Foundation
import AudioKit

class TimeCountLogic {
    var engine = AudioEngine()
    var dangDangDangPlayer = AudioPlayer()
    var url: URL
    var path: String
    
    init() {
        path = Bundle.main.path(forResource: "dangDangDang.m4a", ofType:nil)!
        url = URL(fileURLWithPath: path)
        do {
            try dangDangDangPlayer.load(url: url, buffered: true)
            engine.output = dangDangDangPlayer
            try engine.start()
        } catch {
            fatalError("dangDang engine!")
        }
    }
    
    func dangDangDang() {
        dangDangDangPlayer.play()
    }
}
