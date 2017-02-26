//
//  IRouteSolver.swift
//  MazeRunner
//
//  Created by Brian on 26/02/2017.
//  Copyright © 2017 Iko. All rights reserved.
//

import Foundation

protocol IRouteSolver {
    static func solveRoute(_ nodes: [Node]) -> [Node]
}
