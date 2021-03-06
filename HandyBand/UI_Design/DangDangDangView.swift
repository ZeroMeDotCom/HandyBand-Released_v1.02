//
//  DangDangDangView.swift
//  HandyBand
//
//  Created by Dan on 11/6/21.
// What is DangDangDang View:
    // 1.show the navigation above
    // 2.show all the status
    // 3.speed, is recording or not, which track light, playResutingButton, timeDate, StudentNumber

import SwiftUI

struct DangDangDangView: View {
    @State var speedValue: Int = 50
    @State var isSpeedCountOpen: Bool = true
    @StateObject var dangDangDangModel = TimeCountLogic()
    @EnvironmentObject var recorderPlayer : RecordingLogic

    var body: some View {
        HStack {
            
            //Recording view: light instruction, start recording
            HStack {
                // Button lights
                Group {
                    // 1
                Button(action: {
                    if recorderPlayer.buttonLights[1] {
                        recorderPlayer.buttonLights[1] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 1)
                        recorderPlayer.whichButtonLight = 1
                    }

                }, label: {
                    recorderPlayer.buttonLights[1] ?
                    Image(systemName: "1.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "1.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                })
                    // 2
                Button(action: {
                    if recorderPlayer.buttonLights[2] {
                        recorderPlayer.buttonLights[2] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 2)
                        recorderPlayer.whichButtonLight = 2
                    }

                }, label: {
                    recorderPlayer.buttonLights[2] ?
                    Image(systemName: "2.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "2.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    
                    // 3
                Button(action: {
                    if recorderPlayer.buttonLights[3] {
                        recorderPlayer.buttonLights[3] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 3)
                        recorderPlayer.whichButtonLight = 3
                    }

                }, label: {
                    recorderPlayer.buttonLights[3] ?
                    Image(systemName: "3.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "3.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 4
                Button(action: {
                    if recorderPlayer.buttonLights[4] {
                        recorderPlayer.buttonLights[4] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 4)
                        recorderPlayer.whichButtonLight = 4
                    }

                }, label: {
                    recorderPlayer.buttonLights[4] ?
                    Image(systemName: "4.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "4.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 5
                Button(action: {
                    if recorderPlayer.buttonLights[5] {
                        recorderPlayer.buttonLights[5] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 5)
                        recorderPlayer.whichButtonLight = 5
                    }

                }, label: {
                    recorderPlayer.buttonLights[5] ?
                    Image(systemName: "5.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "5.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    
                    // 6
                Button(action: {
                    if recorderPlayer.buttonLights[6] {
                        recorderPlayer.buttonLights[6] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 6)
                        recorderPlayer.whichButtonLight = 6
                    }

                }, label: {
                    recorderPlayer.buttonLights[6] ?
                    Image(systemName: "6.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "6.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 7
                Button(action: {
                    if recorderPlayer.buttonLights[7] {
                        recorderPlayer.buttonLights[7] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 7)
                        recorderPlayer.whichButtonLight = 7
                    }

                }, label: {
                    recorderPlayer.buttonLights[7] ?
                    Image(systemName: "7.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "7.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 8
                Button(action: {
                    if recorderPlayer.buttonLights[8] {
                        recorderPlayer.buttonLights[8] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 8)
                        recorderPlayer.whichButtonLight = 8
                    }

                }, label: {
                    recorderPlayer.buttonLights[8] ?
                    Image(systemName: "8.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "8.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    
            }
                Group {
                    // 9
                Button(action: {
                    if recorderPlayer.buttonLights[9] {
                        recorderPlayer.buttonLights[9] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 9)
                        recorderPlayer.whichButtonLight = 9
                    }

                }, label: {
                    recorderPlayer.buttonLights[9] ?
                    Image(systemName: "9.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "9.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 10
                Button(action: {
                    if recorderPlayer.buttonLights[10] {
                        recorderPlayer.buttonLights[10] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 10)
                        recorderPlayer.whichButtonLight = 10
                    }

                }, label: {
                    recorderPlayer.buttonLights[10] ?
                    Image(systemName: "10.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "10.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 11
                Button(action: {
                    if recorderPlayer.buttonLights[11] {
                        recorderPlayer.buttonLights[11] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 11)
                        recorderPlayer.whichButtonLight = 11
                    }

                }, label: {
                    recorderPlayer.buttonLights[11] ?
                    Image(systemName: "11.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "11.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 12
                Button(action: {
                    if recorderPlayer.buttonLights[12] {
                        recorderPlayer.buttonLights[12] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 12)
                        recorderPlayer.whichButtonLight = 12
                    }

                }, label: {
                    recorderPlayer.buttonLights[12] ?
                    Image(systemName: "12.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "12.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 13
                Button(action: {
                    if recorderPlayer.buttonLights[13] {
                        recorderPlayer.buttonLights[13] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 13)
                        recorderPlayer.whichButtonLight = 13
                    }

                }, label: {
                    recorderPlayer.buttonLights[13] ?
                    Image(systemName: "13.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "13.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 14
                Button(action: {
                    if recorderPlayer.buttonLights[14] {
                        recorderPlayer.buttonLights[14] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 14)
                        recorderPlayer.whichButtonLight = 14
                    }

                }, label: {
                    recorderPlayer.buttonLights[14] ?
                    Image(systemName: "14.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "14.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
                    // 15
                Button(action: {
                    if recorderPlayer.buttonLights[15] {
                        recorderPlayer.buttonLights[15] = false
                    } else {
                        recorderPlayer.onlyOneButtonLights(index: 15)
                        recorderPlayer.whichButtonLight = 15
                    }

                }, label: {
                    recorderPlayer.buttonLights[15] ?
                    Image(systemName: "15.circle.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                    :
                    Image(systemName: "15.circle")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)

                })
            }
                
                // Specer

                
                // Recording
                Button(action: {
                    print("???????????????: \(recorderPlayer.isRecording)")
                    recorderPlayer.isRecording = !recorderPlayer.isRecording
                    print("????????????: \(recorderPlayer.isRecording)")
                    recorderPlayer.isRecording ? recorderPlayer.startRecording(toWhichLights: recorderPlayer.whichButtonLight) : recorderPlayer.stopRecording()
//                    recorderPlayer.isRecording = !recorderPlayer.isRecording
                }, label: {
                    HStack {
                        recorderPlayer.isRecording ?
                        Image(systemName: "record.circle.fill")
                            .resizable()
                            .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                            .foregroundColor(.red)
                        :
                        Image(systemName: "record.circle")
                            .resizable()
                            .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                            .foregroundColor(.red)
                        
                        recorderPlayer.isCountFour ?
                        Text("Rec")
                            .frame(width: ReocordingButtonH + ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                            .foregroundColor(.red)
                        :
                        Text("\(recorderPlayer.currentMetro)/4")
                            .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                            .foregroundColor(.red)
                    }

                })
                Spacer()
                    .frame(width:ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                
                // Listen the lastest recording
//                Button(action: {
//                    recorderPlayer.isListening = !recorderPlayer.isListening
//                    recorderPlayer.isListening ? recorderPlayer.playThePotencial(filename: recorderPlayer.audioFileName2, samplePlayer: recorderPlayer.samplePlayer, engine: recorderPlayer.engine) : recorderPlayer.listeningStop()
//                    
//                }, label: {
//                    Image(systemName: recorderPlayer.isListening ? "playpause" : "playpause.fill")
//                })

            }
            
            //Counter view: adjust speed, start count button
//            Button(action: {
////                isSpeedCountOpen = !isSpeedCountOpen
//                dangDangDangModel.isOpening = !dangDangDangModel.isOpening
//                dangDangDangModel.isOpening ? dangDangDangModel.oldStyleCount(speed: Double(speedValue)) : dangDangDangModel.oldStyleCountStop()
////                dangDangDangModel.isOpening = !dangDangDangModel.isOpening
//            }) {
//                Image(systemName: dangDangDangModel.isOpening ? "pause.circle" : "play.circle")
//                Text("Ready?:\(dangDangDangModel.metros)")
//            }
            HStack
            {
                //Current Recording Count
                Stepper(onIncrement: {
                    recorderPlayer.metroWish += 1
                }, onDecrement: {
                    recorderPlayer.metroWish -= 1
                }, onEditingChanged: {_ in 
                    print("Current wish change")
                }) {
                    Image(systemName: "c.square.fill")
                        .resizable()
                        .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .center)
                        .foregroundColor(.yellow)
                    Text("\(recorderPlayer.currentRecordingCount)/\(recorderPlayer.metroWish)")
                }
                .frame(width: StepperH, alignment: .center)
                
                Spacer()
                    .frame(width: ControlSpacerH, height: controlPanH, alignment: .center)
                    
                Stepper("BPM: \(Int(recorderPlayer.speed))", onIncrement: {
                    recorderPlayer.speed += 1
                }, onDecrement: {
                    recorderPlayer.speed -= 1
                }, onEditingChanged: {_ in
                    print("Create a new speed")
                })
                .frame(width: StepperH, alignment: .center)
            }
            
        }

    }
}

struct DangDangDangView_Previews: PreviewProvider {
    static var previews: some View {
        DangDangDangView()
    }
}
