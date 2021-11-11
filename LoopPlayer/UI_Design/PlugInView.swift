//
//  PlugInView.swift
//  LoopPlayer
//
//  Created by Dan on 11/4/21.
//

import SwiftUI

struct PlugInView: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @EnvironmentObject var playCreationModel : playCreationsModel
    var body: some View {
        SoundCardPlugInView()
            .environmentObject(fileManage)
            .environmentObject(playCreationModel)
    }
}

struct PlugInView_Previews: PreviewProvider {
    static var previews: some View {
        PlugInView()
    }
}
