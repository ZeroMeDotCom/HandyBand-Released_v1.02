//
//  PodKeyBoard.swift
//  HandyBand
//
//  Created by Dan on 11/7/21.
// Who is this file?
    // Keyborad View

import SwiftUI
import AudioKit

struct PodKeyBoard: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @State private var selection = 1
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
                            MovableButtonKick(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)

                            MovableButtonBassKick(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)

                            MovableButtonSnare(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonSnareTwo(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonClap(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonSideStick(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)
                            
                            
                            MovableButtonHITOM(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonFloorTom(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonHihat(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonCrash(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)
                            
                        }
                        Group {
                            
                            MovableButtonCrashTwo(exclusiveColor: DrumColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonLatin(exclusiveColor: DrumColor)
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
                    fileManage.changeInstrumentToDrum()
                }
            } else if selection == 1 {
                //BassKeyboard
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
                .onAppear() {
                    fileManage.changeInstrumentToString()
                }
            } else if selection == 3 {
                //PianoKeyboard
                VStack{
                    HStack {
                        Group {
                            MovableButtonC(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)

                            MovableButtonPlusC(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)

                            MovableButtonD(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonPlusD(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonE(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonF(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonPlusF(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonG(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonPlusG(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonA(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)
                            
                        }
                        Group {
                            
                            MovableButtonPlusA(exclusiveColor: PianoColor)
                                .environmentObject(fileManage)
                            
                            MovableButtonB(exclusiveColor: PianoColor)
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
