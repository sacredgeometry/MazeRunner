import Foundation
import Cocoa

class Maze {
    let enableNumberOutput: Bool = false
    
    var image: NSImage
    var imageRect: CGRect
    var imageAsCG: CGImage
    var imageRep: NSBitmapImageRep
    
    var width: Int
    var height: Int
    
    func getTilesFromImage(_ image: NSImage) -> [TileState] {
        var output = [TileState]()
        
        for y in 0...height - 1 {
            for x in 0...width - 1 {
                
                let pixelColor = imageRep.colorAt(x: x, y: y)?.brightnessComponent
                
                // If not wall (i.e. black pixel)
                if pixelColor == 0 {
                    output.append(.wall)
                }
                else {
                   output.append(.path)
                }
            }
        }
        
        
        return output
    }
    
    func saveSolvedMaze(_ maze: [TileState]) {
        
        
        if maze.count > 0 {
            var counter: Int = 0
            
            for y in 0...height - 1{
                
                var line = ""
                
                for x in 0...width - 1{
                    
                    let tile = maze[counter]
                    
                    // If not wall (i.e. black pixel)
                    switch tile {
                    case .wall:
                        line += "███"
                        break
                    case .path:
                        line += enableNumberOutput ? "\(String(format: "%03d",counter))" : "   "
                        break
                    case .route:
                        line += " * "
                        break
                    case .start:
                        line += "[S]"
                        break
                    case .end:
                        line += "[E]"
                        break
                    case .node:
                        line += "[+]"
                        break
                    case .deadEnd:
                        line += "[✖]"
                        break
                    case .outOfBounds:
                        break
                    }
                    
                    counter += 1
                }
                
                print(line)
                line = ""
            }
        }
    }
    
    func solveMaze() {
        print("")
        print("------------------------------------")
        print("-------------Solving Maze-----------")
        print("------------------------------------")
        print("")
        
        // --------------------------------------
        // Get Tiles
        // --------------------------------------
        let tiles = getTilesFromImage(image)
        
            
        // --------------------------------------
        // Solve Maze
        // --------------------------------------
        let solvedMaze = MazeRunner<NodeSolver<DirtyOne>>.solve(tiles)
        print("")
        
        // --------------------------------------
        // Image Rendering
        // --------------------------------------
        //TODO: Switch this out for an image renderer
        saveSolvedMaze(solvedMaze)
    }
    
    
    init(_ url: URL) {
        image = NSImage(contentsOf: url)!
        imageRect = CGRect(x: 0, y: 0, width: (image.size.width), height: (image.size.height))
        imageAsCG = image.cgImage(forProposedRect: &imageRect, context: nil, hints: nil)!
        imageRep = NSBitmapImageRep.init(cgImage: imageAsCG)
        width =  Int((image.size.width))
        height =  Int((image.size.height))
    }
}
