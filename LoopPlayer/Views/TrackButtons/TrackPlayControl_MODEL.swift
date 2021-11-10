//
//  NewStylePlayButton.swift
//  LoopPlayer
//
//  Created by Dan on 11/11/21.
//

import SwiftUI
import AudioKit

struct TrackPlayControl_MODEL: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @State private var selection: Int = 0
    @State private var delay_balance : Double = 0.5
    @State private var delay_feedback : Double = 50
    @State private var delay_time : Double = 0.1
    @State private var saltMixerBalance : AUValue = 0.5

    var body: some View {
        VStack {
            Button("T") {
                fileManage.playNewButton(engine: fileManage.engine1, samplePlayer: fileManage.samplePlayer1, fileURL: fileManage.savedFileNames.fileNames["track1"]!["fileWay"]!)
            }
            .buttonStyle(MyButtonStyle2(color: .gray))
            .clipShape(Circle())
            
            //Delay Setting
            Slider(value: $delay_time, in: 0...10, onEditingChanged: {_ in
                fileManage.changeDelay_time(delay_time: $delay_time.wrappedValue, delay: fileManage.delay1)
            })
        
            Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                fileManage.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue, delay: fileManage.delay1)
            })
            Slider(value: $delay_balance, in: 0...100, onEditingChanged: {_ in
                fileManage.changeDelay_balance(delay_balance: $delay_balance.wrappedValue, dryWetMixer: fileManage.dryWetMixer1)
            })
            
            Picker(selection: self.$selection, label: myPickerStyleLabel()) {
                Text("cathedral").tag(0)
                Text("largeHall").tag(1)
                Text("largeHall2").tag(2)
                Text("largeRoom").tag(3)
                Text("mediumChamber").tag(4)

            }
            .pickerStyle(.menu)
            .onChange(of: selection, perform: {
                newValue in
    //            print("Selected Unit: \(places[newValue])", "Selected Index: \(newValue)")
                fileManage.changeDelay_balance(delay_balance: 0, dryWetMixer: fileManage.dryWetMixer1)
                fileManage.change_reverb(place: places[newValue], reverb: fileManage.reverb1)
            })
            
            Slider(value: $saltMixerBalance, in: 0...1, onEditingChanged: {_ in
                fileManage.changeConvolution_balance(convolution_balance: $saltMixerBalance.wrappedValue, saltMixer: fileManage.saltMixer1)
                print("\($saltMixerBalance.wrappedValue)")
            })
        }

    }
}


struct myPickerStyleLabel: View {
    var body: some View {
        Text("Reverb")
    }
}

struct MyButtonStyle2: ButtonStyle {
      var color: Color = .gray
      
      public func makeBody(configuration: MyButtonStyle2.Configuration) -> some View {
          MyButton(configuration: configuration, color: color)
      }
      
      struct MyButton: View {
          let configuration: MyButtonStyle2.Configuration
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
    
    
struct NewStylePlayButton_Previews: PreviewProvider {
    static var previews: some View {
        TrackPlayControl_MODEL()
    }
}
