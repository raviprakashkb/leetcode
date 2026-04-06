
class Solution {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        var x = 0, y = 0
        var dx = 0, dy = 1 // Start facing North
        var mxDist = 0
        
        var obstacleSet = Set<String>()
        for obs in obstacles {
            obstacleSet.insert("\(obs[0]),\(obs[1])")
        }

        for c in commands {
            if c == -1 {
                // Rotate Right: (dx, dy) -> (dy, -dx)
                let temp = dx
                dx = dy
                dy = -temp
            } else if c == -2 {
                // Rotate Left: (dx, dy) -> (-dy, dx)
                let temp = dx
                dx = -dy
                dy = temp
            } else {
                for _ in 0..<c {
                    let nextX = x + dx
                    let nextY = y + dy
                    
                    if obstacleSet.contains("\(nextX),\(nextY)") {
                        break // Hit a wall, stop this command
                    }
                    
                    x = nextX
                    y = nextY
                    
                    mxDist = max(mxDist, x * x + y * y)
                }
            }
        }
        return mxDist
    }
}
