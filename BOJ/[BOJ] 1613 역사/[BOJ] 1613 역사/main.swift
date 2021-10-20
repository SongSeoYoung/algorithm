func solution() {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = info[0]   // 사건갯수
    let k = info[1]   // 알고있는 사건 갯수
    
    var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    (0..<k).forEach { _ in
        let knowing = readLine()!.split(separator: " ").map { Int(String($0))! }
        let one = knowing[0] - 1
        let two = knowing[1] - 1
        arr[one][two] = 1
//        arr[two][one] = 1
    }
    
    let s = Int(readLine()!)!   // 테스트할 사건 갯수
    (0..<s).forEach { _ in
        let test = readLine()!.split(separator: " ").map { Int(String($0))! }
   
        let one = test[0] - 1
        let two = test[1] - 1
        var customQueue = [[Int]]()
        customQueue.append([one, two])
        print("custom queue", customQueue)
        func bfs() {
            let point = customQueue.removeFirst()
            let _one = point[0]
            let _two = point[1]
            print("현재 point", _one, _two)
            for i in 0..<n {
                if arr[_one][i] == 1 {
                    if i == two {
                        print("-1")
                        print("순서대로 잘 찾았음!")
                        customQueue = [[]]
                        break
                    }
                    else {
                        customQueue.append([_one, i])
                    }
                }
            }
            print("0")
        }
        
        while !customQueue.isEmpty {
            print("custom Queue,", customQueue)
            bfs()
        }
        
    }
    
}

solution()
