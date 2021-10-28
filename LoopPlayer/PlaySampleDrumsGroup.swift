//
//  PlaySampleDrumsGroup.swift
//  LoopPlayer
//
//  Created by Dan on 10/29/21.
//

import SwiftUI

struct PlaySampleDrumsGroup: View {
    var body: some View {
        HStack {
            button_sample_play(filename: "sample_drum_one_Edited.wav")
            button_sample_play(filename: "sample_drum_two.wav")
            button_sample_play(filename: "sample_drum_three.wav")
        }
    }
}

struct PlaySampleDrumsGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleDrumsGroup()
    }
}
