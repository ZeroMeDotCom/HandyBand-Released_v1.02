//
//  PlaySampleGuitarGroup.swift
//  LoopPlayer
//
//  Created by Dan on 11/11/21.
// Who is the file?
    // Guitar group view

import SwiftUI

struct PlaySampleGuitarGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic
    var body: some View {
        HStack {
            
            Track_Four().environmentObject(fileManage)
            Track_Five().environmentObject(fileManage)
            Track_Six().environmentObject(fileManage)

        }
    }
}

struct PlaySampleGuitarGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleGuitarGroup()
    }
}
