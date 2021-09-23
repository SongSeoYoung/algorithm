


func solution() {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = info[0] // 벽 정보 (가로 칸 수)
    let m = info[1] // 줄 수 (세로 칸 수)
    
    var arr = Array(repeating: Array(repeating: [0,0,0,0], count: n), count: m)
    
    
    
    for h in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        for w in 0..<line.count {
            arr[h][w] = findArr(value: line[w])
        }
    }
    print(arr)
    
    var visited: [[Int]] = .init()
    var queue: [[Int]] = .init()
    func bfs(h: Int, w: Int) {
        if !queue.isEmpty {
            let start = queue.removeFirst()
            let startH = start[0]
            let startW = start[1]
            for h in 0..<m {
                for w in 0..<n {
                    let info = arr[h][w]
                    for (index, i) in info.enumerated() {
                        if i == 0 {
                            if index == 0 { 서쪽 뚫림 }
                            if index == 1 { 북쪽 뚫림 }
                            if index == 2 { 동쪽 뚫림 }
                            if index == 3 { 남쪽 뚫림 }
                        }
                    }
                }
            }
        }
    }
}
solution()


func findArr(value: Int) -> [Int] {
    // 서 북 동 남
    if value == 1 {
        return [1,0,0,0]
    }
    if value == 2 {
        return [0,1,0,0]
    }
    if value == 3 {
        return [1,1,0,0]
    }
    if value == 4 {
        return [0,0,1,0]
    }
    if value == 5{
        return [1,0,1,0]
    }
    if value == 8 {
        return [0,0,0,1]
    }
    if value == 9 {
        return [1,0,0,1]
    }
    if value == 6 {
        return [0,1,1,0]
    }
    if value == 10 {
        return [0,1,0,1]
    }
    if value == 12 {
        return [0,0,1,1]
    }
    if value == 7 {
        return [1,1,1,0]
    }
    if value == 11 {
        return [1,1,0,1]
    }
    if value == 13 {
        return [1,0,1,1]
    }
    if value == 14 {
        return [0,1,1,1]
    }
    if value == 15 {
        return [1,1,1,1]
    }
    else { return [0,0,0,0] }
}
