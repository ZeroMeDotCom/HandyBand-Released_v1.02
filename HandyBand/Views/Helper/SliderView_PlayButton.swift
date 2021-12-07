//
//  SliderView_PlayButton.swift
//  LoopPlayer
//
//  Created by Dan on 10/30/21.
//  Who is this file?
    // The Play Button Slider View

import SwiftUI

struct SliderView_PlayButton: View {
    @State private var value : Double = 50
    var body: some View {
        Slider(value: $value, in: 0...100, onEditingChanged: {_ in 
            print("\($value)")
            print("\($value.wrappedValue)")
        })
    }
}

struct SliderView_PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        SliderView_PlayButton()
    }
}
