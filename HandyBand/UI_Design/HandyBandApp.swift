//
//  HandyBand.swift
//  HandyBand
//
//  Created by Dan on 10/28/21.
// Who is this file?
    // The Master View

import SwiftUI

@main
struct HandyBandApp: App {
    var fileManage = FileManageLogic()
    var recorderPlayer = RecordingLogic()
    var playCreationModel = playCreationsModel()
    @State private var selection = 0
    var body: some Scene {
        WindowGroup {
            ZStack {
                //BackgondColor
                Color(UIColor(BackgroundColor))
                VStack(
                    alignment: .center
                )
                {
                    VStack {
                        //ControlPan
                        HStack {
                            DangDangDangView()
                                .environmentObject(recorderPlayer)
                            PlayYourCreationView().environmentObject(fileManage)
                            BroswerView()
                        }
                        .frame(width: controlPanW, height: controlPanH, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 17).fill(Color(UIColor.white)))
                        
                        //Four Groups Area
                        VStack {
                            ContentView()
                                .environmentObject(fileManage)
                                .environmentObject(playCreationModel)
                        }
                        .frame(width: TrackWholeW, height: TrackWholeH, alignment: .center)

                    }

                        
                    VStack {
                        Spacer()
                            .frame(height: TopSpacerH, alignment: .center)
                        HStack {
                            Spacer()
                                .frame(width: ColumeSpacerW, alignment: .center)
                            
                            // Instruments Area
                            VStack {
                                Picker(selection: $selection, label: Text("Plug-in or Build-in")) {
                                    Text("Build-in").tag(0)
                                    Text("Plug-in").tag(1)
                                }.pickerStyle(.segmented)
                                //Build-in instruments
                                if selection == 0 {
                                    VStack{
                                        PodKeyBoard().environmentObject(fileManage)
                                    }
                                    .frame(maxWidth: MoveAreaW, maxHeight: MoveAreaH, alignment: .topLeading)

              
                                    //Plug-in View
                                } else if selection == 1 {
                                    HStack {
                                        // Plugin record area
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text("Guitar").foregroundColor(.yellow)
                                                Image(systemName: "guitars").foregroundColor(.yellow)
                                            }
                                            PlaySampleGuitarGroup()
                                                .environmentObject(fileManage)
                                                .environmentObject(playCreationModel)
                                        }
                                        .frame(width: TrackW, alignment: .center)
                                          
                                        
                                        //PlUGIN-Guitar/Bass
                                        PlugInView()
                                            .environmentObject(fileManage)
                                            .environmentObject(playCreationModel)
                                    }


                                }
                            }
                            
                            Spacer()
                                .frame(width: ColumeSpacerW, alignment: .center)

                        }

                    }
                    .frame(width: InstrumentW, height: InstrumentH, alignment: .topLeading)
                    .background(RoundedRectangle(cornerRadius: 17).fill(Color(UIColor.white)))
                    .padding(0)
                }
            }
        }

    }
}
