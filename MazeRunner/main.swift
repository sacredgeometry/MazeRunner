#!/usr/bin/swift

import Foundation
import Cocoa

class Application {
    
    var currentMaze: Maze
    
    init (){
        currentMaze = Maze(URL(fileURLWithPath: "/Users/Brian/Desktop/tiny.png"))
        currentMaze.solveMaze()
        
        //TODO: This is the file loader needs uncommenting on release
//        _ = getFilePaths().map {
//            Maze($0).solveMaze()
//        }
    }
    
    // Opens Dialog and gets list of file paths from Pngs/Bitmaps
    func getFilePaths() -> [URL] {
        print("Please select some files... (Press any button to continue)")
        _ = readLine()
        
        let panel = NSOpenPanel()
        
        panel.allowsMultipleSelection = true
        panel.allowedFileTypes = ["png", "bmp"]
        panel.level = 9001
        
        panel.runModal()
        
        return panel.urls
    }
}


var App = Application()
