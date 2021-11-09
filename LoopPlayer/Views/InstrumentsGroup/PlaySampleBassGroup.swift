//
//  PlaySampleBassGroup.swift
//  LoopPlayer
//
//  Created by Dan on 10/29/21.
//

import SwiftUI

struct PlaySampleBassGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic
    var body: some View {
        HStack {
            button_sample_play(fileURL: fileManage.savedFileNames.fileNames["track4"]!["fileWay"]!, filename: fileManage.singleFileName, url: fileManage.url, path: fileManage.path, engine: fileManage.engine, samplePlayer: fileManage.samplePlayer, isLooping: false, trackID: "track1")
            button_sample_play(fileURL: fileManage.savedFileNames.fileNames["track5"]!["fileWay"]!, filename: fileManage.singleFileName2, url: fileManage.url2, path: fileManage.path2, engine: fileManage.engine2, samplePlayer: fileManage.samplePlayer2, isLooping: false, trackID: "track2")
            button_sample_play(fileURL: fileManage.savedFileNames.fileNames["track6"]!["fileWay"]!, filename: fileManage.singleFileName3, url: fileManage.url3, path: fileManage.path3, engine: fileManage.engine3, samplePlayer: fileManage.samplePlayer3, isLooping: false, trackID: "track3")
        }
    }
}


struct PlaySampleBassGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleBassGroup()
    }
}
