//
//  ReverbPicker.swift
//  HandyBand
//
//  Created by Dan on 10/31/21.
//  Who is this file?
    // The Reverb Picker View

import SwiftUI
import AudioKit

//Reverb places
var places = ["cathedral", "largeHall", "largeHall2", "largeRoom", "mediumChamber"]

struct ReverbPicker: View {
    @State private var selection: Int = 1
    var samplePlayer : SamplePlyer!
    init(samplePlayer: SamplePlyer) {
        self.samplePlayer = samplePlayer
    }
    var body: some View {
        Picker(selection: self.$selection, label: myPickerStyleLabel()) {
            Text("cathedral").tag(0)
            Text("largeHall").tag(1)
            Text("largeHall2").tag(2)
            Text("largeRoom").tag(3)
            Text("mediumChamber").tag(4)

//            ForEach(0..<places.count) {
//                Text(places[$0]).tag($0)
//            }
        }
        .pickerStyle(.menu)
        .onChange(of: selection, perform: {
            newValue in
//            print("Selected Unit: \(places[newValue])", "Selected Index: \(newValue)")
            samplePlayer.changeDelay_balance(delay_balance: 0)
            samplePlayer.change_reverb(place: places[newValue])
        })
        
    }
    
    struct myPickerStyleLabel: View {
        var body: some View {
            Text("Reverb")
        }
    }
}


struct ReverbPicker_Previews: PreviewProvider {
    static var previews: some View {
        let samplePlayer = SamplePlyer(fileURL: "", filename: "", url: URL(fileURLWithPath: ""), path: "", engine: AudioEngine(), samplePlayer: AudioPlayer(), isLooping: false)
        ReverbPicker(samplePlayer: samplePlayer)
    }
}
