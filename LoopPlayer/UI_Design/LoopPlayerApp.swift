//
//  LoopPlayerApp.swift
//  LoopPlayer
//
//  Created by Dan on 10/28/21.
// Who is this file?
    // The Master View

import SwiftUI

@main
struct LoopPlayerApp: App {
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
                        }
                        .frame(width: controlPanW, height: controlPanH, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 17).fill(Color(UIColor.white)))
                        
                        
                        VStack {
                            ContentView()
                                .environmentObject(fileManage)
                                .environmentObject(playCreationModel)
                        }
                        //整體四個
                        .frame(width: TrackWholeW, height: TrackWholeH, alignment: .center)

                    }

                        
                    VStack {
                        Picker(selection: $selection, label: Text("Plug-in or Build-in")) {
                            Text("Build-in").tag(0)
                            Text("Plug-in").tag(1)
                        }.pickerStyle(.segmented)
                        if selection == 0 {
                            PodKeyBoard().environmentObject(fileManage)
      

                        } else if selection == 1 {
                            //PlUGIN-Guitar/Bass
                            PlugInView()
                                .environmentObject(fileManage)
                                .environmentObject(playCreationModel)
                            .border(.red, width: 1)

                        }
                    }
                    .background(RoundedRectangle(cornerRadius: 17).fill(Color(UIColor.white)))
                    .border(.black, width: 3)
                    .padding(0)
                }
            }
        }

    }
}
