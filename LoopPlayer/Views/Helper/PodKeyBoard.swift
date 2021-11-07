//
//  PodKeyBoard.swift
//  LoopPlayer
//
//  Created by Dan on 11/7/21.
//

import SwiftUI
import AudioKit

struct PodKeyBoard: View {
    var engine = AudioEngine()
    var samplePlayer = AudioPlayer()
    init() {
        do {
            try engine.start()
        } catch {
            //
        }
        engine.output = samplePlayer
    }
    @State private var selection = 0
    var body: some View {
        Picker(selection: $selection, label: Text("InstrumentPIcker")) {
            Text("DrumsSound").tag(0)
            Text("BassSound").tag(1)
            Text("StringSound").tag(2)
            Text("PianoSound").tag(3)
        }.pickerStyle(.segmented)
        
        if selection == 0 {
            //TEMP - Drums
            VStack{
                HStack {
                    Group {
                        Button("C3") {
                            print("button pressed!")
                            
                        }
                        .buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#D3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("E3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("F3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#F3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("G3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#G3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("A3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                }
                HStack {
                    Group {
                        Button("C4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#D4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("E4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("F4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#F4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("G4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#G") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("A4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }

                }
                HStack {
                    Group {
                        Button("#C5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#D5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("E5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("F5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#F5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("G5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#G5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("A5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                }
            }
        } else if selection == 1 {
            //BassKeyboard
            VStack{
                HStack {
                    Group {
                        Button("C3") {
                            print("button pressed!")
                        }
                        .buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#D3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("E3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("F3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#F3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("G3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#G3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("A3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                }
                HStack {
                    Group {
                        Button("C4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#D4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("E4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("F4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#F4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("G4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#G") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("A4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }

                }
                HStack {
                    Group {
                        Button("#C5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#D5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("E5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("F5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#F5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("G5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#G5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("A5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                }
            }
        } else if selection == 2 {
            //StringKeyboard
            VStack{
                HStack {
                    Group {
                        Button("C3") {
                            print("button pressed!")
                        }
                        .buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#D3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("E3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("F3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#F3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("G3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#G3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("A3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A3") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                }
                HStack {
                    Group {
                        Button("C4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#D4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("E4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("F4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#F4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("G4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#G") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("A4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A4") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }

                }
                HStack {
                    Group {
                        Button("#C5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#D5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("E5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("F5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#F5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("G5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#G5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("A5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A5") {
                           print("button pressed!")
                       }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                }
            }
        } else if selection == 3 {
            //PianoKeyboard
            VStack{
                HStack {
                    Group {
                        Button("C3") {
                            print("button pressed!")
                        }
                        .buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#D3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("E3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("F3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#F3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("G3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#G3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("A3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B3") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                }
                HStack {
                    Group {
                        Button("C4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#D4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("E4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("F4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#F4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("G4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#G") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("A4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B4") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }

                }
                HStack {
                    Group {
                        Button("#C5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("#C5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("D5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#D5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("E5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("F5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#F5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("G5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("#G5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        Button("A5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                    Group {
                        Button("#A5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                        
                        Button("B5") {
                            print("button pressed!")
                        }.buttonStyle(PodKeyStyle(color: .pink))
                    }
                }
            }
            
        }

        
    
    }
}

struct PodKeyStyle: ButtonStyle {
      var color: Color = .green
      
      public func makeBody(configuration: MyButtonStyle.Configuration) -> some View {
          MyButton(configuration: configuration, color: color)
      }
      
      struct MyButton: View {
          let configuration: PodKeyStyle.Configuration
          let color: Color
          
          var body: some View {
              
              return configuration.label
                  .foregroundColor(.white)
                  .padding(15)
                  .background(RoundedRectangle(cornerRadius: 5).fill(color))
                  .compositingGroup()
                  .shadow(color: .black, radius: 3)
                  .opacity(configuration.isPressed ? 0.5 : 1.0)
          }
      }
  
  }


struct PodKeyBoard_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            PodKeyBoard()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        };if #available(iOS 15.0, *) {
            PodKeyBoard()
                .previewInterfaceOrientation(.landscapeRight)
        } else {
            // Fallback on earlier versions
        }
    }
}
