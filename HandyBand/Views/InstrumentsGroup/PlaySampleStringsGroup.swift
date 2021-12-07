//
//  PlaySampleStringsGroup.swift
//  HandyBand
//
//  Created by Dan on 11/6/21.
// Who is the file?
    // String group view

import SwiftUI

struct PlaySampleStringsGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic
//    @EnvironmentObject var playCreationModel : playCreationsModel
    var body: some View {
        HStack {
            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Seven().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Eight().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Nine().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
        }
    }
}

struct PlaySampleStringsGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleStringsGroup()
    }
}
