import Foundation

func solution() {

    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var arr = Array(repeating: Array(repeating: 0, count: info[0]), count: info[0])
    for _ in 0..<info[1] {
        let list = readLine()!.split(separator: " ").map{ Int(String($0))! }
        arr[list[0] - 1][list[1] - 1] = 1
    }
    var distance = Array(repeating: Int.max, count: info[0])
    distance[0] = 0
    var visited = [[Int]]()
    func dfs(x: Int, y: Int) {
        visited.append([x, y])
        for i in 0..<info[0] {
            if arr[y][i] == 1 && !visited.contains([i, y]) {
                distance[i] = min(distance[y] + 1, distance[i])
                dfs(x: y, y: i)
            }
        }
    }
    dfs(x: info[3] - 1, y: info[3] - 1)

    
    if !distance.contains(info[2]) {
        print(-1)
    }
    else{
        for i in 0..<distance.count {
            if distance[i] == info[2] {
                print(i + 1)
            }
        }
    }
}

solution()

func bfsSolution() {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    var arr = Array(repeating: Array(repeating: 0, count: info[0]), count: info[0])
    for _ in 0..<info[1] {
        let list = readLine()!.split(separator: " ").map{ Int(String($0))! }
        arr[list[0] - 1][list[1] - 1] = 1
    }
    var distance = Array(repeating: Int.max, count: info[0])
    distance[0] = 0
    var queue = [[0,0]]
    var visited = [[Int]]()
    while !queue.isEmpty {
        let dir = queue.remove(at: 0)
        visited.append(dir)
            for i in 0..<info[0] {
                if arr[dir[1]][i] == 1 && !visited.contains([dir[1]]){
                    queue.append([dir[1], i])
                    distance[i] = min(distance[dir[1]] + 1, distance[i])
                }
            }
    }

    if !distance.contains(info[2]) {
        print(-1)
    }
    else{
        for i in 0..<distance.count {
            if distance[i] == info[2] {
                print(i + 1)
            }
        }
    }
    
}

bfsSolution()
