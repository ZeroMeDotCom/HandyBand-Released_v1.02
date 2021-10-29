//
//  PlaySampleBassGroup.swift
//  LoopPlayer
//
//  Created by Dan on 10/29/21.
//

import SwiftUI

struct PlaySampleBassGroup: View {
    var body: some View {
        HStack {
            button_sample_play(filename: "sample_bass_110_8_one.wav")
            button_sample_play(filename: "sample_bass_110_8_two.wav")
            button_sample_play(filename: "sample_bass_110_8_three.wav")
        }
    }
}

struct PlaySampleBassGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleBassGroup()
    }
}
