//
//  PlaySampleStringsGroup.swift
//  LoopPlayer
//
//  Created by Dan on 11/6/21.
//

import SwiftUI

struct PlaySampleStringsGroup: View {
    var body: some View {
        HStack {
            button_sample_play(filename: "sample_drum_110_8_one.wav")
            button_sample_play(filename: "sample_drum_110_8_two.wav")
            button_sample_play(filename: "sample_drum_110_8_three.wav")
        }
    }
}

struct PlaySampleStringsGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleStringsGroup()
    }
}
