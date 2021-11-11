//
//  PlaySampleBassGroup.swift
//  LoopPlayer
//
//  Created by Dan on 10/29/21.
// Who is the file?
    // Bass group view

import SwiftUI

struct PlaySampleBassGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic

    var body: some View {
        HStack {
            
            Track_Four().environmentObject(fileManage)
            Track_Five().environmentObject(fileManage)
            Track_Six().environmentObject(fileManage)

        }
    }
}


struct PlaySampleBassGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleBassGroup()
    }
}
