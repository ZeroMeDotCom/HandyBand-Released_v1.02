//
//  PlayYourCreationView.swift
//  LoopPlayer
//
//  Created by Dan on 11/7/21.
//

import SwiftUI

struct PlayYourCreationView: View {
    var fileManage = FileManageLogic()
    var body: some View {
        Button("TTTT"){
            fileManage.playResuting()
        }
    }
}

struct PlayYourCreationView_Previews: PreviewProvider {
    static var previews: some View {
        PlayYourCreationView()
    }
}
