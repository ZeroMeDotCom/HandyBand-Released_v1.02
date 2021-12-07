//
//  GetSystemPathWay.swift
//  HandyBand
//
//  Created by Dan on 11/10/21.
//  Who is this file? -> Get file path as URL type MODEL

import Foundation

public class GetSystemPathWay {

    func getFileURL(fileURL: String) -> URL {
        let path = self.getDocumentsDirectory().appendingPathComponent(fileURL)
        return path as URL
        }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        }

}
