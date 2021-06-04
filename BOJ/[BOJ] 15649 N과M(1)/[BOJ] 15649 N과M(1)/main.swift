func solution() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let N = info[0]
    let M = info[1]
    
    var numberArr: [Int] = Array(repeating: 0, count: M)
    var visited = Array(repeating: false, count: N+1)
    func backtracking(index: Int) {
        print("backraking!!!!!!!!!")
        if index == M {
            for i in 0..<M {
                print(numberArr[i], terminator: " ")
            }
            print()
            print("return 부름")
            return
        } else {
            print("depth 만족안해")
            for i in 1...N {
                if visited[i] == false {
                    print("방문안한거 찾았어",i, "찾음")
                    print("num arr에 넣었어")
                    numberArr[index] = i
                    print("visited 처리했어")
                    visited[i] = true
                    print("backraking 재귀불렀음")
                    backtracking(index: index+1)
                    print("return 부르면 바로 여기로오나?")
                    print("다시 방문안함으로 처리했음", i,"를")
                    visited[i] = false
                    print(visited)
                }
            }
        }
    }
    backtracking(index: 0)
}

solution()
