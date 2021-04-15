func solution() {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = info[0]
    let m = info[1]
    let c = info[2] - 1
    var arr: [[[Int]]] = Array(repeating: [[Int]](), count: n)
    var visitied = Array(repeating: false, count: n)
    var distance = Array(repeating: 987654321, count: n)
    
    for i in 0..<m {
        let list = readLine()!.split(separator: " ").map { Int(String($0))! }
        arr[list[0] - 1].append([list[1] - 1, list[2]])
    }

    func getShortDistance() -> Int {
        var minValue = Int.max
        var index = 0
        for i in 0..<n {
            if distance[i] < minValue && (!visitied[i]) {
                minValue = distance[i]
                index = i
            }
        }
        return index
    }
    //다익스트라
    distance[c] = 0
    visitied[c] = true
    for info in arr[c]{
        let destination = info[0]
        let value = info[1]
        distance[destination] = value
    }
    
    for i in 0..<n {
        let currentShort = getShortDistance()
        visitied[currentShort] = true
        
        for j in arr[currentShort] {
            let cost = distance[currentShort] + j[1]
            if cost < distance[j[0]] {
                distance[j[0]] = cost
            }
        }
    }
    var maxTime = 0
    var count = 0
    for i in 0..<distance.count {
        if distance[i] == 0 {
            // 시작지점
            continue
        } else if distance[i] != Int.max{
            maxTime = max(maxTime, distance[i])
            count += 1
        }
    }
    print(count, maxTime)
}

solution()

/*
 3 2 1
 1 2 4
 1 3 2
 */
