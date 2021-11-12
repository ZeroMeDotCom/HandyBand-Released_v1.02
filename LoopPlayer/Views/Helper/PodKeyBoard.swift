//
//  PodKeyBoard.swift
//  LoopPlayer
//
//  Created by Dan on 11/7/21.
// Who is this file?
    // Keyborad View

import SwiftUI
import AudioKit

@available(iOS 15.0, *)
struct PodKeyBoard: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @State private var selection = 0
    var body: some View {
        VStack {
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
                            MovableButtonC(exclusiveColor: BassColor)
                                .environmentObject(fileManage)

                            MovableButtonPlusC(exclusiveColor: BassColor)
                                .environmentObject(fileManage)

                            MovableButtonD(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonPlusD(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonE(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonF(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                            
                            
                            MovableButtonPlusF(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonG(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonPlusG(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonA(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                            
                        }
                        Group {
                            
                            MovableButtonPlusA(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonB(exclusiveColor: BassColor)
                                .environmentObject(fileManage)
                        }
                    }
                    //兩排按鈕備註掉
    //                HStack {
    //                    Group {
    //                        Button("C4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#C4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("D4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#D4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("E4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("F4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#F4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("G4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#G") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("A4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                    Group {
    //                        Button("#A4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("B4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //
    //                }
    //                HStack {
    //                    Group {
    //                        Button("#C5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#C5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("D5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#D5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("E5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("F5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#F5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("G5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#G5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("A5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                    Group {
    //                        Button("#A5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("B5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                }
                }
                .onAppear(){
                    fileManage.changeInstrumentToBass()
                }
            } else if selection == 1 {
                //BassKeyboard
                VStack{
                    HStack {
                        Group {
                            MovableButtonC(exclusiveColor: StringColor)
                                .environmentObject(fileManage)

                            MovableButtonPlusC(exclusiveColor: StringColor)
                                .environmentObject(fileManage)

                            MovableButtonD(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonPlusD(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonE(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonF(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonPlusF(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonG(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonPlusG(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonA(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                            
                        }
                        Group {
                            
                            MovableButtonPlusA(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonB(exclusiveColor: StringColor)
                                .environmentObject(fileManage)
                        }
                    }
    //                HStack {
    //                    Group {
    //                        Button("C4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#C4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("D4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#D4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("E4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("F4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#F4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("G4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#G") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("A4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                    Group {
    //                        Button("#A4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("B4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //
    //                }
    //                HStack {
    //                    Group {
    //                        Button("#C5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#C5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("D5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#D5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("E5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("F5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#F5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("G5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#G5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("A5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                    Group {
    //                        Button("#A5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("B5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                }
                }
                .onAppear(){
                    fileManage.changeInstrumentToBass()
                }
            } else if selection == 2 {
                //StringKeyboard
                VStack{
                    HStack {
                        Group {
                            Button("C3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_C, samplePlayer: fileManage.samplePlayer_C, engine: fileManage.engine_C)
                            }
                            .buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("#C3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusC, samplePlayer: fileManage.samplePlayer_PlusC, engine: fileManage.engine_PlusC)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("D3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_D, samplePlayer: fileManage.samplePlayer_D, engine: fileManage.engine_D)
                                
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("#D3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusD, samplePlayer: fileManage.samplePlayer_PlusD, engine: fileManage.engine_PlusD)
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("E3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_E, samplePlayer: fileManage.samplePlayer_E, engine: fileManage.engine_E)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("F3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_F, samplePlayer: fileManage.samplePlayer_F, engine: fileManage.engine_F)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("#F3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusF, samplePlayer: fileManage.samplePlayer_PlusF, engine: fileManage.engine_PlusF)
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("G3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_G, samplePlayer: fileManage.samplePlayer_G, engine: fileManage.engine_G)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("#G3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusG, samplePlayer: fileManage.samplePlayer_PlusG, engine: fileManage.engine_PlusG)
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("A3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_A, samplePlayer: fileManage.samplePlayer_A, engine: fileManage.engine_A)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                        }
                        Group {
                            Button("#A3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusA, samplePlayer: fileManage.samplePlayer_PlusA, engine: fileManage.engine_PlusA)
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("B3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_B, samplePlayer: fileManage.samplePlayer_B, engine: fileManage.engine_B)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                        }
                    }
    //                HStack {
    //                    Group {
    //                        Button("C4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#C4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("D4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#D4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("E4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("F4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#F4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("G4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#G") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("A4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                    Group {
    //                        Button("#A4") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("B4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //
    //                }
    //                HStack {
    //                    Group {
    //                        Button("#C5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#C5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("D5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#D5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("E5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("F5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#F5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("G5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#G5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("A5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                    Group {
    //                        Button("#A5") {
    //                           print("button pressed!")
    //                       }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("B5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                }
                }
                .onAppear() {
                    fileManage.changeInstrumentToString()
                }
            } else if selection == 3 {
                //PianoKeyboard
                VStack{
                    HStack {
                        Group {
                            Button("C3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_C, samplePlayer: fileManage.samplePlayer_C, engine: fileManage.engine_C)
                            }
                            .buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("#C3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusC, samplePlayer: fileManage.samplePlayer_PlusC, engine: fileManage.engine_PlusC)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("D3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_D, samplePlayer: fileManage.samplePlayer_D, engine: fileManage.engine_D)
                                
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("#D3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusD, samplePlayer: fileManage.samplePlayer_PlusD, engine: fileManage.engine_PlusD)
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("E3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_E, samplePlayer: fileManage.samplePlayer_E, engine: fileManage.engine_E)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("F3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_F, samplePlayer: fileManage.samplePlayer_F, engine: fileManage.engine_F)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("#F3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusF, samplePlayer: fileManage.samplePlayer_PlusF, engine: fileManage.engine_PlusF)
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("G3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_G, samplePlayer: fileManage.samplePlayer_G, engine: fileManage.engine_G)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("#G3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusG, samplePlayer: fileManage.samplePlayer_PlusG, engine: fileManage.engine_PlusG)
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("A3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_A, samplePlayer: fileManage.samplePlayer_A, engine: fileManage.engine_A)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                        }
                        Group {
                            Button("#A3") {
                               print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_PlusA, samplePlayer: fileManage.samplePlayer_PlusA, engine: fileManage.engine_PlusA)
                           }.buttonStyle(PodKeyStyle(color: .pink))
                            
                            Button("B3") {
                                print("button pressed!")
                                fileManage.playSingle(url: fileManage.url_B, samplePlayer: fileManage.samplePlayer_B, engine: fileManage.engine_B)
                            }.buttonStyle(PodKeyStyle(color: .pink))
                        }
                    }
    //                HStack {
    //                    Group {
    //                        Button("C4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#C4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("D4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#D4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("E4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("F4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#F4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("G4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#G") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("A4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                    Group {
    //                        Button("#A4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("B4") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //
    //                }
    //                HStack {
    //                    Group {
    //                        Button("#C5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("#C5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("D5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#D5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("E5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("F5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#F5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("G5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("#G5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                        Button("A5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                    Group {
    //                        Button("#A5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //
    //                        Button("B5") {
    //                            print("button pressed!")
    //                        }.buttonStyle(PodKeyStyle(color: .pink))
    //                    }
    //                }
                }
                .onAppear() {
                    fileManage.changeInstrumentToPiano()
                }
                
            }
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
