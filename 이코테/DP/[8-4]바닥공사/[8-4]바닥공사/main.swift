func solution () {
    var dp = [Int]()
    dp.append(0)
    dp.append(1)
    dp.append(2)
    let n = Int(String(readLine()!))!
    for i in 3...n {
        dp.append(dp[i-1] * 2 + 1)
    }
    print(dp[n])
}

solution()
