//
//  TileState.swift
//  MazeRunner
//
//  Created by Brian on 25/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

enum TileState {
    case path
    case wall
    case node
    case route
    case start
    case end
    case outOfBounds
    case deadEnd
}
