func solution() {
    let number = Int(String(readLine()!))!
    var arr = Array(repeating: Array(repeating: -1, count: number), count: number)
    for i in 0..<number {
        let list = readLine()!.split(separator: " ").map { Int(String($0))! }
        for j in 0..<list.count {
            arr[i][j] = list[j]
        }
    }
//    print(arr)
    var dp = Array(repeating: Array(repeating: 0, count: number), count: number)
    for i in 0..<number {
        for j in 0..<number {
            if i == 0 && j == 0 {
                dp[i][j] = arr[i][j]
            }
            else if arr[i][j] != -1 {
                if j != 0 {
                    dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + arr[i][j]
                }
                else {
                    dp[i][j] = dp[i-1][j] + arr[i][j]
                }
            }
        }
    }
    print(dp[number-1].max()!)
}

solution()
