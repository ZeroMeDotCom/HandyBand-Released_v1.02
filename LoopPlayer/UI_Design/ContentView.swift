//
//  ContentView.swift
//  LoopPlayer
//
//  Created by Dan on 10/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            HStack(alignment: .top) {
                VStack{
                    Text("Drum Group").border(.black, width: 1)
                    PlaySampleDrumsGroup()
                }
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)

                VStack {
                    Text("Bass Group")
                    PlaySampleBassGroup()
                }
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            }
            .border(Color.blue, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            
            HStack {
                VStack {
                    Text("String Group")
                    PlaySampleBassGroup()
                }
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                
                VStack {
                    Text("Piano Group")
                    PlaySampleBassGroup()
                }
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            }
            .border(Color.blue, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        }
        .border(.yellow, width: 2)
        .padding(0)
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
