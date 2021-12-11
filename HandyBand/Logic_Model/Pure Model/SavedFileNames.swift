//
//  SavedFileNames.swift
//  HandyBand
//
//  Created by Dan on 11/9/21.
// Who is this file?
    // 1. Track file mange model

import Foundation

class SavedFileNames {
    var fileNames : [String : [String : String]] = [
        "track1" : ["isPause" : "true",
                    "fileWay" : "track1_drum1.m4a",
                   ],
        "track2" : ["isPause" : "true",
                    "fileWay" : "track2_drum2.m4a",
                   ],
        "track3" : ["isPause" : "true",
                    "fileWay" : "track3_drum3.m4a",
                   ],
        "track4" : ["isPause" : "true",
                    "fileWay" : "track4_bass1.m4a",
                   ],
        "track5" : ["isPause" : "true",
                    "fileWay" : "track5_bass2.m4a",
                   ],
        "track6" : ["isPause" : "true",
                    "fileWay" : "track6_bass3.m4a",
                   ],
        "track7" : ["isPause" : "true",
                    "fileWay" : "track7_string1.m4a",
                   ],
        "track8" : ["isPause" : "true",
                    "fileWay" : "track8_string2.m4a",
                   ],
        "track9" : ["isPause" : "true",
                    "fileWay" : "track9_string3.m4a",
                   ],
        "track10" : ["isPause" : "true",
                    "fileWay" : "track10_piano1.m4a",
                   ],
        "track11" : ["isPause" : "true",
                    "fileWay" : "track11_piano2.m4a",
                   ],
        "track12" : ["isPause" : "true",
                    "fileWay" : "track12_piano3.m4a",
                   ],
        "track13" : ["isPause" : "true",
                    "fileWay" : "track13_guitar1.m4a",
                   ],
        "track14" : ["isPause" : "true",
                    "fileWay" : "track14_guitar2.m4a",
                   ],
        "track15" : ["isPause" : "true",
                    "fileWay" : "track15_guitar3.m4a",
                   ],

    ]
    
    // Future - update the file from internet
    func update() {
        
    }
    
    // Future - delete files
    func delete() {
        
    }
    
    // Future - might be useful
    func chooseFileName() {
        
    }
}
