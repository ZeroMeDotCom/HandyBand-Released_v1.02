//
//  GetSystemPathWay.swift
//  LoopPlayer
//
//  Created by Dan on 11/10/21.
//

import Foundation

public class GetSystemPathWay {
    //直接獲取URL版本播放
    func getFileURL(fileURL: String) -> URL {
        let path = self.getDocumentsDirectory().appendingPathComponent(fileURL)
        return path as URL
        }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
        }

}
