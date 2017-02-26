//
//  DirtyOne.swift
//  MazeRunner
//
//  Created by Brian on 25/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class DirtyOne: INodeSolver {
    
    static let width = 10
    static let height = 10
    
    static func solveNodes(_ tiles: [TileState]) -> [Node] {
        
        //TODO: Fix these sizes
        
        var output = [Node]()
        
        // Rules
        // 1. if on a wall do nothing
        // 2. if on a path but was just on a wall
        var counter = 0
        for y in 0...height - 1 {
            for x in 0...width - 1 {
             
                // If wall do nothing...
                if tiles[counter]  == .wall { }
                else {
                    if tiles[counter] == .none && tiles[counter - 1] == .wall {
                        
                        if getTileAtRelativePosition(counter, tiles, .up) == .wall && getTileAtRelativePosition(counter, tiles, .down) == .wall { }
                        else {
                            output.append(Node(counter, [nil, nil, nil, nil]))
                        }
                    }
                }
                
                counter += 1
            }
        }
        
        return output
    }
    
    static func getTileAtRelativePosition(_ index: Int, _ tiles: [TileState], _ position: TilePosition) -> TileState? {
        switch position {
        case .left:
            return tiles.count <= index-1 ? tiles[index-1] : nil
        case .up:
            return tiles.count <= index-width ? tiles[index-width] : nil
        case .right:
            return tiles.count >= index+1 ? tiles[index+1] : nil
        case .down:
            return tiles.count >= index+width ? tiles[index+width] : nil
        case .center:
            return tiles[index]
        }
    }
    
    static func solvePath(_ nodes: [Node]) -> [Node] {
        return nodes
    }
}
