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
    
    var index: Int = 0
    var neighbours: [Node?] = [nil, nil, nil, nil] // left top right bottom
    
    init (_ index: Int, _ tiles: [TileState]) {
    }
    
}
