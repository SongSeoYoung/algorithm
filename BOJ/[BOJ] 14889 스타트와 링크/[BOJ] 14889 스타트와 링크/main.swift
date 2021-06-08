func solution() {
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    for _ in 0..<n {
        arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    var minArr = [Int]()
    func combination() {
        var totalN = [Int]()
        (0..<n).forEach {
            totalN.append($0)
        }
       
        let N = n
        let M:Int = n/2
        
        var team1: [Int] = Array(repeating: 0, count: M)
        var visited = Array(repeating: false, count: N)
        func backtracking(index: Int) {
            if index == M {
                var team2 = [Int]()
                for i in 0..<totalN.count {
                    if !team1.contains(totalN[i]) {
                        team2.append(totalN[i])
                    }
                }
                var team1sum = 0
                var team2sum = 0
                for i in 0..<team1.count {
                    for j in i+1..<team1.count {
                        team1sum += arr[team1[i]][team1[j]]
                        team1sum += arr[team1[j]][team1[i]]
                        team2sum += arr[team2[i]][team2[j]]
                        team2sum += arr[team2[j]][team2[i]]
                    }
                }
                
               
                minArr.append(abs(team1sum - team2sum))
                return
            } else {
                for i in 0..<N {
                    if visited[i] == false {
                        team1[index] = i
                        visited[i] = true
                        backtracking(index: index+1)
                        //return 부르면 바로 여기로옴
                        visited[i] = false
                    }
                }
            }
        }
        backtracking(index: 0)
    }
    combination()
    print(minArr.min()!)
}




solution()
