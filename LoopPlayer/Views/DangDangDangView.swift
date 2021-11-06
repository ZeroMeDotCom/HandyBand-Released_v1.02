//
//  DangDangDangView.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

import SwiftUI

struct DangDangDangView: View {
    @State var speedValue: Int = 60
    @State var isSpeedCountOpen: Bool = true
    @StateObject var dangDangDangModel = TimeCountLogic()

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
            
            //Timer version
            
            
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
