//
//  PlaySampleDrumsGroup.swift
//  LoopPlayer
//
//  Created by Dan on 10/29/21.
//

import SwiftUI

struct PlaySampleDrumsGroup: View {
    var body: some View {
        VStack {
            HStack {
                //Test
                button_sample_play(filename: "Old Dark Ages.mp3")
                
                button_sample_play(filename: "sample_drum_110_8_one.wav")
                button_sample_play(filename: "sample_drum_110_8_two.wav")
                button_sample_play(filename: "sample_drum_110_8_three.wav")
            }
        }
    }
}

struct PlaySampleDrumsGroup_Previews: PreviewProvider {
    static var previews: some View {
        PlaySampleDrumsGroup()
    }
}
