//
//  PlaySampleDrumsGroup.swift
//  HandyBand
//
//  Created by Dan on 10/29/21.
// Who is the file?
    // Drum group view

import SwiftUI

struct PlaySampleDrumsGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic

    var body: some View {
        HStack {
            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_One().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Two().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Three().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            
        }
        
    }
}

struct PlaySampleDrumsGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleDrumsGroup()
    }
}
