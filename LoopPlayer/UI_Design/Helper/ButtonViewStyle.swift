//
//  ButtonViewStyle.swift
//  LoopPlayer
//
//  Created by Dan on 11/11/21.
// Who is the file?
    // Buttonstyke UI Setting

import SwiftUI

struct ButtonViewStyle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

// Recording Button
struct MyButtonStyle3: ButtonStyle {
      var color: Color = .yellow
      
      public func makeBody(configuration: MyButtonStyle2.Configuration) -> some View {
          MyButton(configuration: configuration, color: color)
      }
      
      struct MyButton: View {
          let configuration: MyButtonStyle2.Configuration
          let color: Color
          
          var body: some View {
              
              return configuration.label
                  .foregroundColor(.white)
                  .padding(0)
                  .frame(width: controlPanH, height: controlPanH)
                  .background(RoundedRectangle(cornerRadius: 5).fill(color))
                  .compositingGroup()
                  .shadow(color: .black, radius: 3)
                  .opacity(configuration.isPressed ? 0.5 : 1.0)
          }
      }
  
  }

//Pre-listening Button
struct MyButtonStyle2: ButtonStyle {
      var color: Color = .yellow
      
      public func makeBody(configuration: MyButtonStyle2.Configuration) -> some View {
          MyButton(configuration: configuration, color: color)
      }
      
      struct MyButton: View {
          let configuration: MyButtonStyle2.Configuration
          let color: Color
          
          var body: some View {
              
              return configuration.label
                  .foregroundColor(.white)
                  .padding(0)
                  .frame(width: controlPanH, height: controlPanH)
                  .background(RoundedRectangle(cornerRadius: 5).fill(color))
                  .compositingGroup()
                  .shadow(color: .black, radius: 3)
                  .opacity(configuration.isPressed ? 0.5 : 1.0)
          }
      }
  
  }

struct ButtonViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonViewStyle()
    }
}
