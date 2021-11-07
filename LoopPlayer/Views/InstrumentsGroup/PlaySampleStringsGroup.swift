//
//  PlaySampleStringsGroup.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

import SwiftUI

struct PlaySampleStringsGroup: View {
    @EnvironmentObject var fileManager : FileManageLogic
    var body: some View {
        HStack {
            button_sample_play(filename: fileManager.singleFileName, url: fileManager.url, path: fileManager.path, engine: fileManager.engine, samplePlayer: fileManager.samplePlayer, isLooping: false, trackID: "track1")
            button_sample_play(filename: fileManager.singleFileName2, url: fileManager.url2, path: fileManager.path2, engine: fileManager.engine2, samplePlayer: fileManager.samplePlayer2, isLooping: false, trackID: "track2")
            button_sample_play(filename: fileManager.singleFileName3, url: fileManager.url3, path: fileManager.path3, engine: fileManager.engine3, samplePlayer: fileManager.samplePlayer3, isLooping: false, trackID: "track3")
        }
    }
}

struct PlaySampleStringsGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleStringsGroup()
    }
}
