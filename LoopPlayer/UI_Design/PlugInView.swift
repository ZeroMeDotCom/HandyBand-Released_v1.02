//
//  PlugInView.swift
//  LoopPlayer
//
//  Created by Dan on 11/4/21.
//

import SwiftUI

struct PlugInView: View {
    var body: some View {
        SoundCardPlugInView()
            .padding(.init(top: -400, leading: 10, bottom: 400, trailing: 10))
    }
}

struct PlugInView_Previews: PreviewProvider {
    static var previews: some View {
        PlugInView()
    }
}
