//
//  PlaySamplePianoGroup.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

import SwiftUI

struct PlaySamplePianoGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic
//    @EnvironmentObject var playCreationModel : playCreationsModel
    var body: some View {
        HStack {
            button_sample_play(fileURL: fileManage.savedFileNames.fileNames["track10"]!["fileWay"]!, filename: fileManage.singleFileName, url: fileManage.url, path: fileManage.path, engine: fileManage.engine, samplePlayer: fileManage.samplePlayer, isLooping: false, trackID: "track10")
                .environmentObject(fileManage)
            
            button_sample_play(fileURL: fileManage.savedFileNames.fileNames["track11"]!["fileWay"]!, filename: fileManage.singleFileName2, url: fileManage.url2, path: fileManage.path2, engine: fileManage.engine2, samplePlayer: fileManage.samplePlayer2, isLooping: false, trackID: "track11")
                .environmentObject(fileManage)
            
            button_sample_play(fileURL: fileManage.savedFileNames.fileNames["track12"]!["fileWay"]!, filename: fileManage.singleFileName3, url: fileManage.url3, path: fileManage.path3, engine: fileManage.engine3, samplePlayer: fileManage.samplePlayer3, isLooping: false, trackID: "track12")
                .environmentObject(fileManage)
        }
    }
}

struct PlaySamplePianoGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySamplePianoGroup()
    }
}
