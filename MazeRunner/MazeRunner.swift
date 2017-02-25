//
//  MazeRunner.swift
//  MazeRunner
//
//  Created by Brian on 25/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class MazeRunner<T:IMazeRunner> {
    static func solve(_ tiles: [TileState]) -> [TileState] {
        return T.solve(tiles)
    }
}
