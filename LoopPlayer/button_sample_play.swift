//
//  button_sample_play.swift
//  LoopPlayer
//
//  Created by Dan on 10/28/21.
//  What's this file for?
        //Define the play button

import SwiftUI

struct button_sample_play: View {
    var samplePlyer : SamplePlyer!
    var filename : String
    init(filename: String){
        self.filename = filename
        samplePlyer = SamplePlyer(filename: filename, loopNumber: 1)
    }
    var body: some View {
        Button("▷") {
            //
        }
        .buttonStyle(MyButtonStyle(color: .gray))
        .clipShape(Circle())
        .gesture(TapGesture(count: 1).onEnded { samplePlyer.play() })
        .simultaneousGesture(TapGesture(count: 2).onEnded { samplePlyer.stop() })
    }

}


//Button style setting
struct MyButtonStyle: ButtonStyle {
      var color: Color = .gray
      
      public func makeBody(configuration: MyButtonStyle.Configuration) -> some View {
          MyButton(configuration: configuration, color: color)
      }
      
      struct MyButton: View {
          let configuration: MyButtonStyle.Configuration
          let color: Color
          
          var body: some View {
              
              return configuration.label
                  .foregroundColor(.white)
                  .padding(15)
                  .frame(width: 50, height: 50)
                  .background(RoundedRectangle(cornerRadius: 5).fill(color))
                  .compositingGroup()
                  .shadow(color: .black, radius: 3)
                  .opacity(configuration.isPressed ? 0.5 : 1.0)
          }
      }
  
  }

struct button_sample_play_Previews: PreviewProvider {
    static var previews: some View {
        button_sample_play(filename: "sample_drum_one_Edited.wav")
    }
}
