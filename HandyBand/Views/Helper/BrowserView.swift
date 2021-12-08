//
//  BrowserView.swift
//  HandyBand
//
//  Created by DanTereson on 08/12/2021.
//  Who is this file?
//   //1. Open Safari inside app
     //2. Show a website where end users can read instructions and watch a video of demonstration

import SwiftUI
import SafariServices

struct BroswerView: View {
    @State private var safariIsShown: Bool = false
    var body: some View {
        Button(action: {
            self.safariIsShown.toggle()
            print("pressed")
        }, label: {
            Image(systemName: self.safariIsShown ? InfoIconPressed : InfoIcon)
                .resizable()
                .frame(width: ReocordingButtonH, height: ReocordingButtonH, alignment: .trailing)
                .foregroundColor(InfoIconColor)
        })
        .fullScreenCover(isPresented: $safariIsShown, content: {
            SFSafariViewWrapper(url: URL(string: InfoWebsite)!)
        })
    }
}

struct SFSafariViewWrapper: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: self.url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}

struct BrowserView_Previews: PreviewProvider {
    static var previews: some View {
        BroswerView()
    }
}
