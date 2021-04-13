func solution() {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let sum = info[1]
    var arr = [Int]()
    var dp = Array(repeating: 0, count: sum + 1)
    for i in 0..<info[0] {
        let n = Int(readLine()!)!
        arr.append(n)
        if n <= sum{
            dp[n] = 1
        }
        
    }

    for i in 1...sum {
        if dp[i] == 1 {
            continue
        } else {
            var minV = Int.max
            for a in arr {
                if i - a <= 0 {
                    minV = min(minV, Int.max)
                } else if dp[i-a] != 0{
                    minV = min(minV, dp[i-a] + 1)
                }
            }
            if minV == Int.max {
                dp[i] = 0
            }else { dp[i] = minV}
        }
    }
    print(dp.last! == 0 ? -1 : dp.last!)
}
solution()
