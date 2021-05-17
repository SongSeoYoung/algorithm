func solution() {
    while true {
        print("-----------------------------")
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        if input == [0,0] { break }
        
        var arr = [[Int]]()
        for i in 0..<input[1] {
            let list = readLine()!.split(separator: " ").map { Int(String($0))! }
            arr.append(list)
        }
        var queue = [[Int]]()
        var visited = [[Int]]()
        func checkRange(x: Int, y: Int) -> Bool {
            if 0..<input[0] ~= x && 0..<input[1] ~= y { return true }
            return false
        }
        let dirY = [1,1,1,0,0,0,-1,-1,-1]
        let dirX = [-1,0,1,-1,0,1,-1,0,1]
        func bfs() {
            while !queue.isEmpty {
                let q = queue.remove(at: 0)
                let h = q[0]
                let w = q[1]
                for i in 0..<dirY.count {
                    let newY = h + dirY[i]
                    let newX = w + dirX[i]
                    if checkRange(x: newX, y: newY) && !(visited.contains([newY, newX])) {
                        visited.append([newY, newX])
                        if arr[newY][newX] == 1 {
                            queue.append([newY, newX])
                        }
                    }
                }
            }
        }
        var count = 0
        for h in 0..<input[1] {
            for w in 0..<input[0] {
                if arr[h][w] == 1 && !(visited.contains([h, w])){
                    visited.append([h, w])
                    queue.append([h, w])
                    bfs()
                    count += 1
                }
            }
        }
        print(count)
    }
    
}

solution()
