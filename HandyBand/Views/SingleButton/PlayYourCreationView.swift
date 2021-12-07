//
//  PlayYourCreationView.swift
//  HandyBand
//
//  Created by Dan on 11/7/21.
// Who is this file?
    // The Play The Final Creation view

import SwiftUI


struct PlayYourCreationView: View {
    @EnvironmentObject var fileManage : FileManageLogic
    var body: some View {
        HStack {
            Spacer()
                .frame(width: ControlSpacerH, alignment: .center)
            Button(action: {
                fileManage.isPause = !fileManage.isPause
                fileManage.isPause ? fileManage.pauseThepProcessing() : fileManage.playResuting()
            }, label: {
                fileManage.isPause ?
                Image(systemName:  "infinity.circle")
                    .resizable()
                    .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    .foregroundColor(.purple)
                :
                Image(systemName: "infinity.circle.fill")
                    .resizable()
                    .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    .foregroundColor(.purple)
            })
        }

    }
}

struct PlayYourCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PlayYourCreationView()
    }
}
