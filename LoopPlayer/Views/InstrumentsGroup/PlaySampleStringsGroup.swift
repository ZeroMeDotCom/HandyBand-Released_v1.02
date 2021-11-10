//
//  PlaySampleStringsGroup.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

import SwiftUI

struct PlaySampleStringsGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic
//    @EnvironmentObject var playCreationModel : playCreationsModel
    var body: some View {
        HStack {
            Track_Seven().environmentObject(fileManage)
            Track_Eight().environmentObject(fileManage)
            Track_Nine().environmentObject(fileManage)
//            button_sample_play(fileURL: fileManage.savedFileNames.fileNames["track7"]!["fileWay"]!, filename: fileManage.singleFileName, url: fileManage.url, path: fileManage.path, engine: fileManage.engine, samplePlayer: fileManage.samplePlayer, isLooping: false, trackID: "track7")
//                .environmentObject(fileManage)
//            
//            button_sample_play(fileURL: fileManage.savedFileNames.fileNames["track8"]!["fileWay"]!, filename: fileManage.singleFileName2, url: fileManage.url2, path: fileManage.path2, engine: fileManage.engine2, samplePlayer: fileManage.samplePlayer2, isLooping: false, trackID: "track8")
//                .environmentObject(fileManage)
//            
//            button_sample_play(fileURL: fileManage.savedFileNames.fileNames["track9"]!["fileWay"]!, filename: fileManage.singleFileName3, url: fileManage.url3, path: fileManage.path3, engine: fileManage.engine3, samplePlayer: fileManage.samplePlayer3, isLooping: false, trackID: "track9")
//                .environmentObject(fileManage)
        }
    }
}

struct PlaySampleStringsGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleStringsGroup()
    }
}
