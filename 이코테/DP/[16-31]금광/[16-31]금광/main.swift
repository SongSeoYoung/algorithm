func solution() {
    let testCase = Int(String(readLine()!))!
    for i in 0..<testCase {
        let info = readLine()!.split(separator: " ").map { Int(String($0))! }
        // info[0] = 3 info[1] = 4 (3X4)
        var arr = Array(repeating: Array(repeating: 0, count: info[1] + 1), count: info[0] + 2)
        var text = readLine()!.split(separator: " ").map { Int(String($0))! }
        for j in 1...info[0] {
            for k in 1...info[1] {
                arr[j][k] = text.first!
                text.remove(at: 0)
            }
        }
        var dp = arr
        print(dp)
        for h in 1...info[0] {
            for w in 1...info[1] {
                if h==1 && w == 1 {
                    dp[h][w] = arr[h][w]
                }
                else if h == 1 && w != 1{
                    dp[h][w] = max(dp[h][w-1], dp[h+1][w-1]) + arr[h][w]
                } else if w == 1 && h != 1{
                    dp[h][w] = arr[h][w]
                } else {
                    dp[h][w] = max(dp[h-1][w-1] , dp[h][w-1], dp[h+1][w-1]) + arr[h][w]
                }
            }
        }
        print(dp)
        print(dp[info[0]][info[1]])
    }
}

solution()
