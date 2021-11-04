//
//  SoundCardPlugInView.swift
//  LoopPlayer
//
//  Created by Dan on 11/4/21.
//

import SwiftUI

struct SoundCardPlugInView: View {
    @StateObject var soundCardPlugIn = SoundCardPlugInLogic()
    @State var stopFlag: Bool
    init() {
        self.stopFlag = true
    }
    var body: some View {
        HStack {
            Text("Session!!")
            Button(action: {
                self.stopFlag ? self.soundCardPlugIn.stopSession() : self.soundCardPlugIn.openSession()
                self.stopFlag = !self.stopFlag
                
            }, label: {
    //            self.stopFlag ? Text("◼︎") : Text("►")
                Image(systemName: self.stopFlag ? "stop.fill" : "play.fill")
            })
        }

    }
}

struct SoundCardPlugInView_Previews: PreviewProvider {
    static var previews: some View {
        SoundCardPlugInView()
    }
}
