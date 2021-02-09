func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    let width: Int = n
    let height: Int = m
    var Arr: [[Character]] = board.map{ Array($0) }
    var result: Int = 0
    var visited: [[Int]] = [[Int]]()
    
    func dfs(startH: Int, startW: Int) {
        let check: Character = Arr[startH][startW]
        if startH + 1 < height && startW + 1 < width{
            if check != " " && Arr[startH][startW + 1] == check && Arr[startH + 1][startW + 1] == check && Arr[startH + 1][startW] == check {
//                print("4개 만들어짐")
                    visited.append([startH, startW + 1])
                    visited.append([startH + 1, startW + 1])
                    visited.append([startH + 1, startW])
                    dfs(startH: startH, startW: startW + 1)
                    dfs(startH: startH + 1, startW: startW + 1)
                    dfs(startH: startH + 1, startW: startW)
                }
        }
    }

    func makeNewArr(_ setVisited: [[Int]]) {
        for i in 0..<setVisited.count {
            Arr[setVisited[i][0]][setVisited[i][1]] = " "
        }
        for h in 0..<height - 1 {
            for w in 0..<width {
                if Arr[h + 1][w] == " " {
                    Arr[h+1][w] = Arr[h][w]
                    Arr[h][w] = " "
                }
            }
        }
    }
    func dfsLoop() {
        
        for h in 0..<height {
            for w in 0..<width {
                visited = []
                visited.append([h, w])
                
                if Arr[h][w] != " " {
                    print("\(h), \(w)에 대해서 디에프에스를 돕니다.")
                    dfs(startH: h, startW: w)
                    let SetVisited: [[Int]] = Array(Set(visited))
                    print(SetVisited)
                    if SetVisited.count >= 4{
                        result += SetVisited.count
                        print("현재까지 누적된 터트린 값 \(result)")
                        makeNewArr(SetVisited)
                        print(Arr)
                        dfsLoop()
                    }
                }
            }
        }
    }
    dfsLoop()
    
    return result
}

print(solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"]))
