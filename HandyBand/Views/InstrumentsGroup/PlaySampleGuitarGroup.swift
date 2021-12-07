//
//  PlaySampleGuitarGroup.swift
//  HandyBand
//
//  Created by Dan on 11/11/21.
// Who is the file?
    // Guitar group view

import SwiftUI

struct PlaySampleGuitarGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic
    var body: some View {
        HStack {
            
            Track_Thirteen_PlugIn_One().environmentObject(fileManage)
            Track_Fourteen_PlugIn_Two().environmentObject(fileManage)
            Track_Fifteen_PlugIn_Three().environmentObject(fileManage)

        }
    }
}

struct PlaySampleGuitarGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleGuitarGroup()
    }
}
