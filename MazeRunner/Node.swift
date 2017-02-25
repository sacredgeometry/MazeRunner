//
//  Node.swift
//  MazeRunner
//
//  Created by Brian on 25/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation
import Cocoa

class Node {
    
    var neighbours: [Node?] = [nil, nil, nil, nil] // left top right bottom
    var position: Coord = Coord()
    
    init (_ imageRep: NSBitmapImageRep, _ x: Int, _ y: Int) {
        position.x = x
        position.y = y
        
        // RULES
        // if left is wall and current is path (make node)
        // if 
    }
    
}
