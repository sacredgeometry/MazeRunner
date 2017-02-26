//
//  NodeSolver.swift
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
    
    static func findPath(_ nodes: [Node]) -> [Node]  {
        return T.solvePath(nodes)
    }
    
    static func solve(_ tiles: [TileState]) -> [TileState] {
        
        var output = tiles
        let path = findPath(findNodes(tiles))
        
        for (i, node) in path.enumerated() {
            
            if i == 0 {
                output[node.index] = .start
                continue
            }
            if i == path.count - 1{
                    output[node.index] = .end
                    continue
            }
            
            output[node.index] = .node
        }
        
        return output
    }
}
