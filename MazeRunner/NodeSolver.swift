//
//  Solver.swift
//  MazeRunner
//
//  Created by Brian on 25/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class NodeSolver<T: INodeSolver> : IMazeRunner {
    static func findPath(_ nodes: [Node]) -> [Node]  {
        return T.solve(nodes)
    }
    
    static func solve(_ tiles: [TileState]) -> [TileState] {
        return tiles
    }
}