//
//  Solver.swift
//  MazeRunner
//
//  Created by Brian on 25/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class NodeSolver<T: INodeSolver> : IMazeRunner {
    static func findPath(_ tiles: [TileState]) -> [Node]  {
        return T.solve(tiles)
    }
    
    static func solve(_ tiles: [TileState]) -> [TileState] {
        
        let nodes = findPath(tiles)
        
        for node in nodes {
            
        }
        
        return tiles
    }
}
