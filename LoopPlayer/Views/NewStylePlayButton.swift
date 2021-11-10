//
//  NewStylePlayButton.swift
//  LoopPlayer
//
//  Created by Dan on 11/11/21.
//

import SwiftUI

struct NewStylePlayButton: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @State private var delay_balance : Double = 0.5
    @State private var delay_feedback : Double = 50
    @State private var delay_time : Double = 0.1
    var body: some View {
        VStack {
            Button("T") {
                fileManage.playNewButton()
            }
            .buttonStyle(MyButtonStyle2(color: .gray))
            .clipShape(Circle())
            
            //Delay Setting
            Slider(value: $delay_time, in: 0...10, onEditingChanged: {_ in
                fileManage.changeDelay_time(delay_time: $delay_time.wrappedValue)
            })
        
            Slider(value: $delay_feedback, in: 0...100, onEditingChanged: {_ in
                fileManage.changeDelay_feedback(delay_feedback: $delay_feedback.wrappedValue)
            })
            Slider(value: $delay_balance, in: 0...100, onEditingChanged: {_ in
                fileManage.changeDelay_balance(delay_balance: $delay_balance.wrappedValue)
            })
        }

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
        NewStylePlayButton()
    }
}
