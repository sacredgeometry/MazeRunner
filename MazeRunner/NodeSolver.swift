//
//  Solver.swift
//  MazeRunner
//
//  Created by Brian on 25/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class NodeSolver<T: INodeSolver> : IMazeRunner {
    static func findNodes(_ tiles: [TileState]) -> [Node]  {
        return T.solveNodes(tiles)
    }
    
    static func findPath(_ nodes: [Node]) -> [TileState]  {
        return T.solvePath(nodes)
    }
    
    static func solve(_ tiles: [TileState]) -> [TileState] {
        
        
        
        return findPath(findNodes(tiles))
    }
}
