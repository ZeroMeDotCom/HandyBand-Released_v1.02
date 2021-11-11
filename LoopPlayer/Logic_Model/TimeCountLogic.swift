//
//  TimeCountLogic.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
// Who is the file?
    // 1. counter, text speed
    // 2. after 4 counters, start recording and stop at the wanting segement

import Foundation
import AudioKit

class TimeCountLogic: ObservableObject {

    var engine = AudioEngine()
    var dangDangDangPlayer = AudioPlayer()
    var url: URL
    var path: String
    var speed: Double = 130
    @Published var isOpening: Bool = false
    var timerDeliver = Timer()
    var metros: Int = 1
    var metroWish: Int = 5 //read is 8 - 4
    
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
    
    // Count stop function
    func oldStyleCountStop() {
        self.dangDangDangStop()
        }
    // Count start function
    func oldStyleCount(speed: Double) {
        do {
            try engine.start()
            
        } catch {
            //
        }
        
        self.isOpening = true
        Timer.scheduledTimer(withTimeInterval: 60 / speed, repeats: true) { timerDeliver in
            if self.isOpening {
                self.dangDangDang()
                self.metros += 1
                print(self.metros)
            }
            
            if self.metros == self.metroWish {
                print(self.metros)
                timerDeliver.invalidate()
                self.isOpening = !self.isOpening
                self.metros = 1
                
                
            }
        }

    }
    
    func dangDangDang() {
        dangDangDangPlayer.play()
    }
    
    func dangDangDangStop() {
        self.isOpening = false
        timerDeliver.invalidate()
//        dangDangDangPlayer.stop()
//        engine.stop()
    }
}
