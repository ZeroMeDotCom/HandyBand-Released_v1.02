//
//  DangDangDangView.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
// What is DangDangDang:
    // 1.show the navagation
    // 2.show all the status
    // 3.metro, speed, recordiing? which track light, playResutingButton, timeDate, StudentNumber

import SwiftUI

struct DangDangDangView: View {
    @State var speedValue: Int = 60
    @State var isSpeedCountOpen: Bool = true
    @StateObject var dangDangDangModel = TimeCountLogic()
    @EnvironmentObject var recorderPlayer : RecordingLogic

    var body: some View {
        HStack {
            //Timeline Version
//            if #available(iOS 15.0, *) {
//                TimelineView(.periodic(from: .now, by: 60 / Double(speedValue))) { content in
//                    Text(content.date.formatted(date: .omitted, time: .standard))
//                    let randomEmoji = emoji.randomElement() ?? ""
//                    Text(randomEmoji)
//                }
//            } else {
//                // Fallback on earlier versions
//            }
            
            
            //Recording view: light instruction, start recording
            HStack {
                Button(action: {
                    recorderPlayer.isRecording ? recorderPlayer.stopRecording() : recorderPlayer.startRecording()
                    recorderPlayer.isRecording = !recorderPlayer.isRecording
                }, label: {
                    Image(systemName: recorderPlayer.isRecording ? "record.circle.fill" : "record.circle")
                })
                Button(action: {
                    recorderPlayer.isRecording ? recorderPlayer.listeningStop() : recorderPlayer.playThePotencial(filename: recorderPlayer.audioFileName, samplePlayer: recorderPlayer.samplePlayer, engine: recorderPlayer.engine)
                    recorderPlayer.isListening = !recorderPlayer.isListening
                }, label: {
                    Image(systemName: recorderPlayer.isListening ? "playpause" : "playpause.fill")
                })

            }
            //Counter view: adjust speed, start count button
            Button(action: {
//                isSpeedCountOpen = !isSpeedCountOpen
                dangDangDangModel.isOpening = !dangDangDangModel.isOpening
                dangDangDangModel.isOpening ? dangDangDangModel.oldStyleCount(speed: Double(speedValue)) : dangDangDangModel.oldStyleCountStop()
            }) {
                Image(systemName: dangDangDangModel.isOpening ? "pause.circle" : "play.circle")
                Text("Ready?:\(dangDangDangModel.metros)")
            }
            HStack
            {
                Stepper("BPM: \(speedValue)", onIncrement: {
                    speedValue += 1
                }, onDecrement: {
                    speedValue -= 1
                }, onEditingChanged: {_ in
                    print("Create a new speed")
                })
                .frame(width: 300, alignment: .trailing)
            }
        }

    }
}

struct DangDangDangView_Previews: PreviewProvider {
    static var previews: some View {
        DangDangDangView()
    }
}
