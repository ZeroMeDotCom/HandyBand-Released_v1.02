//
//  button_sample_play.swift
//  LoopPlayer
//
//  Created by Dan on 10/28/21.
//  What's this file for?
        //Define the play button
        //.. and teh slider

import SwiftUI

struct button_sample_play: View {
    //Delay: varible for slider
    @State private var delay_balance : Double = 0.5
    @State private var delay_feedback : Double = 0.5
    @State private var delay_time : Double = 0.01
    @State private var value : Double = 50
    @State private var isOn = false
    

    var samplePlyer : SamplePlyer!
    
    var filename : String
    init(filename: String){
        self.filename = filename
        samplePlyer = SamplePlyer(filename: filename, isLooping: true)
    }
    var body: some View {
        VStack {
            Button(isOn ? "□" : "▷") {
                //
            }
            .buttonStyle(MyButtonStyle(color: .gray))
            .clipShape(Circle())
            .gesture(TapGesture(count: 1).onEnded {
                samplePlyer.play()
                isOn = true
            })
            .simultaneousGesture(TapGesture(count: 2).onEnded {
                samplePlyer.stop()
                isOn = false
            })
            
            Slider(value: $value, in: 0...100, onEditingChanged: {_ in
                samplePlyer.changeVolume(value: $value.wrappedValue)
            })
            
            //Delay Setting
            Slider(value: $delay_time, in: 0...1, onEditingChanged: {_ in
                samplePlyer.changeDelay_time(delay_time: $delay_time.wrappedValue)
            })
            Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                samplePlyer.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue)
            })
            Slider(value: $delay_balance, in: 0...99, onEditingChanged: {_ in
                samplePlyer.changeDelay_balance(delay_balance: $delay_balance.wrappedValue)
            })
            
            //Reverb Setting
            ReverbPicker(samplePlayer: samplePlyer)
            
        }
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
