func solution() {
    let friendN = Int(readLine()!)!
    let listN = Int(readLine()!)!
    var arr = Array(repeating: Array(repeating: false, count: friendN + 1), count: friendN + 1)
    for _ in 0..<listN {
        let info = readLine()!.split(separator: " ").map { Int($0)! }
        arr[info[0]][info[1]] = true
        arr[info[1]][info[0]] = true
    }
    
    let startX = 1
    let startY = 1
    var visited = [[Int]]()
    var result: Set<Int> = Set<Int>()
    func dfs(x: Int, y: Int, depth: Int = 1) {
        var d = depth
        if d >= 3 { return }
//        print(x, y)
        visited.append([y, x])
//        print(visited)
//        print(result, "result")
        for i in 2...friendN {
            if arr[y][i] == true && (!visited.contains([y, i])){
                result.insert(i)
                dfs(x: y, y: i, depth: d + 1)
            }
        }
    }
    dfs(x: startX, y: startY)
    print(result.count)
}

solution()
