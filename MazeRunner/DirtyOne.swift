//
//  DirtyOne.swift
//  MazeRunner
//
//  Created by Brian on 25/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

class DirtyOne: INodeSolver {
    
    //TODO: Fix these sizes
    static let width = 10
    static let height = 10

    // ---------------------------------------
    // Solve Nodes
    // ---------------------------------------
    
    static func solveNodes(_ tiles: [TileState]) -> [Node] {
        
        var output = [Node]()
        
        // Rules
        // 1. if on a wall do nothing
        // 2. if on a path but was just on a wall
        var i = 0
        for _ in 0...height - 1 {
            
            for _ in 0...width - 1 {
             
                // If wall do nothing...
                if tiles[i]  == .wall { }
                else {
                    // Is Path test rules!
                    if let testedTile = runRuleSet(i, tiles) {
                        output.append(testedTile)
                    }
                }
                
                i += 1
            }
        }
        
        //TODO: Assign
        
        return output
    }
    
    // Node Rules
    static func runRuleSet(_ index: Int, _ tiles: [TileState]) -> Node? {
        
        let relatives = getAllRelatives(index, tiles)
        let left = relatives["left"]!
        let up = relatives["up"]!
        let right = relatives["right"]!
        let down = relatives["down"]!
        
        var isNode = false
        
        // if start or end node ignore
        if index < width || index >= tiles.count - width {
             isNode = true
        } else {
            // If is walkable right or down
            if isWalkable(right) ||  isWalkable(down) {
                isNode = true
            }
            if isWalkable(left) && isWalkable(up) {
                isNode = true
            }
            if (!isWalkable(up) && !isWalkable(down)) && (isWalkable(right) && isWalkable(left)) {
                isNode = false
            }
            if (isWalkable(up) && isWalkable(down)) && (!isWalkable(right) && !isWalkable(left)) {
                isNode = false
            }
        }
        
        return isNode ? Node(index, [:]) : nil
    }
    
    
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
    static func isWalkable(_ t: TileState)  -> Bool {
        return t != .wall && t != .outOfBounds
    }
    
    static func isDeadEnd(_ index: Int, _ tiles: [TileState]) -> Bool {
        return getAllRelatives(index, tiles).filter { $0.value == .wall }.count >= 3
    }
    
    static func getAllRelatives(_ index: Int, _ tiles: [TileState]) -> [String : TileState] {
        var output: [String : TileState] = [:]
        
        output["left"] = getTilesAtRelativePosition(index, tiles, .left)
        output["up"] = getTilesAtRelativePosition(index, tiles, .up)
        output["right"] = getTilesAtRelativePosition(index, tiles, .right)
        output["down"] = getTilesAtRelativePosition(index, tiles, .down)
        
        return output
    }
    
    static func getTilesAtRelativePosition(_ index: Int, _ tiles: [TileState], _ position: TilePosition) -> TileState {
        switch position {
        case .left:
            return index-1 >= 0  ? tiles[index-1] : .outOfBounds
        case .up:
            return index-width >= 0  ? tiles[index-width] : .outOfBounds
        case .right:
            return index+1 <= tiles.count ? tiles[index+1] : .outOfBounds
        case .down:
            return index+width <= tiles.count  ? tiles[index+width] : .outOfBounds
        case .center:
            return tiles[index]
        }
    }
    
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
