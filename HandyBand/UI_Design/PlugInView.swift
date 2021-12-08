//
//  PlugInView.swift
//  HandyBand
//
//  Created by Dan on 11/4/21.
// Who is this file?
    // The Plug-in View

import SwiftUI

struct PlugInView: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @EnvironmentObject var playCreationModel : playCreationsModel
    var body: some View {
        HStack {
            SoundCardPlugInView()
                .environmentObject(fileManage)
                .environmentObject(playCreationModel)
        }
        .frame(width: GuitarEffectChangeW + GuitarEffecPreW, alignment: .center)
    }
}

struct PlugInView_Previews: PreviewProvider {
    static var previews: some View {
        PlugInView()
    }
}
