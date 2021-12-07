//
//  PlaySampleBassGroup.swift
//  HandyBand
//
//  Created by Dan on 10/29/21.
// Who is the file?
    // Bass group view

import SwiftUI

struct PlaySampleBassGroup: View {
    @EnvironmentObject var fileManage : FileManageLogic

    var body: some View {
        HStack {
            
            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Four().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Five().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
            Track_Six().environmentObject(fileManage)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color(UIColor.white)))


            Spacer()
                .frame(width: SingleTrackGroupSpecerH)
        }
    }
}


struct PlaySampleBassGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleBassGroup()
    }
}
