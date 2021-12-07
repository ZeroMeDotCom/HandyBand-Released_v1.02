//
//  ContentView.swift
//  HandyBand
//
//  Created by Dan on 10/28/21.
// Who is this file?
    // The 4 Groups View

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var fileManage : FileManageLogic
    @EnvironmentObject var playCreationModel : playCreationsModel
    var body: some View {
        VStack {
            
            HStack() {
                VStack(alignment: .leading){
                    HStack {
                        Text("Drum").foregroundColor(.yellow)
                        Image(systemName: "square.grid.3x3.fill").foregroundColor(.yellow)
                    }
                    PlaySampleDrumsGroup()
                        .environmentObject(fileManage)
                        .environmentObject(playCreationModel)
                }
                .frame(width: TrackW, height: TrackH, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 17).fill(Color(UIColor.white)))
                


                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Bass").foregroundColor(.yellow)
                            Image(systemName: "square.grid.3x3.fill").foregroundColor(.yellow)
                        }
                        PlaySampleBassGroup()
                            .environmentObject(fileManage)
                            .environmentObject(playCreationModel)
                    }
                .frame(width: TrackW, height: TrackH, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 17).fill(Color(UIColor.white)))

            }

        }


            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("String").foregroundColor(.yellow)
                        Image(systemName: "square.grid.3x3.fill").foregroundColor(.yellow)
                    }
                    PlaySampleStringsGroup()
                        .environmentObject(fileManage)
                        .environmentObject(playCreationModel)
                }
                .frame(width: TrackW, height: TrackH, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 17).fill(Color(UIColor.white)))
                   

                VStack(alignment: .leading) {
                    HStack {
                        Text("Piano").foregroundColor(.yellow)
                        Image(systemName: "square.grid.3x3.fill").foregroundColor(.yellow)
                    }
                    PlaySamplePianoGroup()
                        .environmentObject(fileManage)
                        .environmentObject(playCreationModel)
                }
                .frame(width: TrackW, height: TrackH, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 17).fill(Color(UIColor.white)))

            }
                
        }
        //整体四个
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            ContentView().previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
