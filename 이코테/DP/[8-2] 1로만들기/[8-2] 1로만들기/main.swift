func solution() {
    let number = Int(String(readLine()!))!
    var dp = Array(repeating: 0, count: number + 1)
    for i in 2...number {
        var two = Int.max
        var three = Int.max
        var five = Int.max
        let minus = dp[i-1]
        if i % 2 == 0 {
            two = dp[i/2]
        }
        if i % 3 == 0{
            three = dp[i/3]
        }
        if i % 5 == 0 {
            five = dp[i/5]
        }
        dp[i] = min(five, three, two, minus) + 1
    }
    print(dp[number])
}

solution()
