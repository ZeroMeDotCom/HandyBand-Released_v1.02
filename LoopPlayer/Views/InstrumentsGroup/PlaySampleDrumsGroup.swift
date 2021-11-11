//
//  PlaySampleDrumsGroup.swift
//  LoopPlayer
//
//  Created by Dan on 10/29/21.
// Who is the file?
    // Drum group view

import SwiftUI

struct PlaySampleDrumsGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic

    var body: some View {
        HStack {
            Track_One().environmentObject(fileManage)
            Track_Two().environmentObject(fileManage)
            Track_Three().environmentObject(fileManage)
            
        }
        
    }
}

struct PlaySampleDrumsGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleDrumsGroup()
    }
}
