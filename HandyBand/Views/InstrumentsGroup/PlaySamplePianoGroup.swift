//
//  PlaySamplePianoGroup.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
// Who is the file?
    // Piano group view

import SwiftUI

struct PlaySamplePianoGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic
//    @EnvironmentObject var playCreationModel : playCreationsModel
    var body: some View {
        HStack {
            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Ten().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Eleven().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Twelve().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
        }
    }
}

struct PlaySamplePianoGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySamplePianoGroup()
    }
}
