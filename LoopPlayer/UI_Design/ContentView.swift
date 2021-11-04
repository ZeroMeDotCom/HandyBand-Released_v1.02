//
//  ContentView.swift
//  LoopPlayer
//
//  Created by Dan on 10/28/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack{
                Text("Drum Group")
                PlaySampleDrumsGroup()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 100))
            VStack {
                Text("Bass Group")
                PlaySampleBassGroup()
            }
            .padding(EdgeInsets(top: 10, leading: 100, bottom: 10, trailing: 10))
        }
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 500, trailing: 10))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
