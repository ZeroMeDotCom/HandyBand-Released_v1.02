//
//  LoopPlayerApp.swift
//  LoopPlayer
//
//  Created by Dan on 10/28/21.
//

import SwiftUI

@main
struct LoopPlayerApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
                //整體四個
                .frame(width: fourGroupWidth, height: fourGroupHeight, alignment: .center)
                .position(x: screenWidth / 2, y: fourGroupHeight - 150)
                .border(.red, width: 2)
                PlugInView()
                .border(.red, width: 1)
                .frame(width: screenWidth / 3, height: screenHeight / 5, alignment: .trailing)
                .position(x: screenWidth / 1.5, y: screenHeight / 4)
            }
            .border(.black, width: 3)

        }
    }
}
