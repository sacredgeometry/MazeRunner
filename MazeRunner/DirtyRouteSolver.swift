//
//  DirtyRouteSolver.swift
//  MazeRunner
//
//  Created by Brian on 26/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class DirtyRouteSolver : IRouteSolver {
    
    //TODO: Fix these sizes
    static let width = 10
    static let height = 10
    
    // ---------------------------------------
    // Solve Path
    // ---------------------------------------
    
    static func solveRoute(_ nodes: [Node]) -> [Node] {
        
        // Get neighbours
        let path: [Node] = nodes.map {
            $0.neighbours = getNeighbours($0.index, nodes)
            return $0
        }
        
        for (i, node) in nodes.enumerated() {
            //TODO: Pathfinding!
        }
        
        return path
    }
    
    
    // ---------------------------------------
    // Helper Methods
    // ---------------------------------------
    
    static func getNeighbours(_ index: Int, _ nodes: [Node]) -> [String : Node] {
        var output: [String : Node] = [:]
        
        if let left = getNodeAtRelativePosition(index, nodes, .left) {
            output["left"] = left
        }
        if let up = getNodeAtRelativePosition(index, nodes, .up) {
            output["up"] = up
        }
        if let right = getNodeAtRelativePosition(index, nodes, .right) {
            output["right"] = right
        }
        if let down = getNodeAtRelativePosition(index, nodes, .down) {
            output["down"] = down
        }
        
        return output
    }
    
    static func getNodeAtRelativePosition(_ i: Int, _ nodes: [Node], _ position: TilePosition) -> Node? {
        switch position {
        case .left:
            return i - 1 >= 0  ? nodes.filter{ $0.index == i-1 }.first : nil
        case .up:
            return i - width >= 0  ? nodes.filter{ $0.index == i-width }.first : nil
        case .right:
            return i + 1 <= nodes.count ? nodes.filter{ $0.index == i+1 }.first : nil
        case .down:
            return i + width <= nodes.count  ? nodes.filter{ $0.index == i+width }.first : nil
        case .center:
            return nodes[i]
        }
    }
}
