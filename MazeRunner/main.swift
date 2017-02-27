#!/usr/bin/swift

import Foundation
import Cocoa

class Application {
    
    init (){        _ = getFilePaths().map {
        // Do stuff here!
            Maze<DirtyNodeSolver, DirtyRouteSolver>($0).solveMaze()
        }
    }
    
    // Opens Dialog and gets list of file paths from Pngs/Bitmaps
    func getFilePaths() -> [URL] {
        let panel = NSOpenPanel()
        
        panel.allowsMultipleSelection = true
        panel.allowedFileTypes = ["png", "bmp"]
        panel.level = 9001
        
        panel.runModal()
        
        return panel.urls
    }
}

class Settings {
    var width = 0
    var height = 0
}

var Config = Settings()
var App = Application()
