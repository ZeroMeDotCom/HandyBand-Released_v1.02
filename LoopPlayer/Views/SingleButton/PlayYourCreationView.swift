//
//  PlayYourCreationView.swift
//  LoopPlayer
//
//  Created by Dan on 11/7/21.
//

import SwiftUI


struct PlayYourCreationView: View {
    @EnvironmentObject var fileManage : FileManageLogic
    var body: some View {
        Button(action: {
            fileManage.isPause = !fileManage.isPause
            fileManage.isPause ? fileManage.pauseThepProcessing() : fileManage.playResuting()
        }, label: {
            Image(systemName: fileManage.isPause ? "infinity.circle" : "infinity.circle.fill")
        })
    }
}

struct PlayYourCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PlayYourCreationView()
    }
}
