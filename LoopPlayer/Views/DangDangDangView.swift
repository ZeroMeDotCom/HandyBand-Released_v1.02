//
//  DangDangDangView.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

import SwiftUI

struct DangDangDangView: View {
    @State var speedValue: Int = 60
    var dangDangDangModel = TimeCountLogic()
    
    var metros: Int = 4

    var emoji = ["😀", "😬", "😄", "🙂", "😗", "🤓", "😏", "😕", "😟", "😎", "😜", "😍", "🤪"]

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
            
            //Timeer version
            Button(action: {
                dangDangDangModel.dangDangDang()
            }) {
                Image(systemName: "play.circle")
                Text("Lead count")
            }
            Stepper("BPM: \(speedValue)", onIncrement: {
                speedValue += 1
            }, onDecrement: {
                speedValue -= 1
            }, onEditingChanged: {_ in
                print("Create a new speed")
            })
        }

    }
}

struct DangDangDangView_Previews: PreviewProvider {
    static var previews: some View {
        DangDangDangView()
    }
}
