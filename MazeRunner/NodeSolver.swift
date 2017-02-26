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
        let solvedNodes = T.solveNodes(tiles)
        print("Total Node Count: \(solvedNodes.count)")
        return solvedNodes
    }
    
    static func findRoute(_ nodes: [Node]) -> [Node]  {
        let solvedPath = T.solveRoute(nodes)
        print("Amount of nodes in path: \(solvedPath.count)")
        return solvedPath
    }
    
    // This interates the route information into the tiles set
    static func solve(_ tiles: [TileState]) -> [TileState] {
        
        var output = tiles
        let path = findRoute(findNodes(tiles))
        
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
