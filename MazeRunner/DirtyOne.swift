//
//  DirtyOne.swift
//  MazeRunner
//
//  Created by Brian on 25/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class DirtyOne: INodeSolver {
    static func solveNodes(_ tiles: [TileState]) -> [Node] {
        
        //TODO: Fix these sizes
        let width = 10 - 1
        let height = 10 - 1
        var output: [String : Node] = [String : Node]()
        
        // Rules
        // 1. if on a wall do nothing
        // 2. if on a path but was just on a wall
        var counter = 0
        for y in 0...height {
            for x in 0...width {
             
                if tiles[counter]  == .wall {
                    counter += 1
                    continue
                }
                
                if tiles[counter] == .none && tiles[counter - 1] == .wall { output["\(x).\(y)"] = Node(counter, [nil, nil, nil, nil]) }
                
                counter += 1
            }
        }
        
        
        return output.map { return $0.value }
    }
    
    
    static func solvePath(_ nodes: [Node]) -> [Node] {
        return nodes
    }
}
