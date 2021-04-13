func solution() {
    let number = Int(String(readLine()!))!
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dp = [0,arr[0], arr[1], arr[0] + arr[2]]
    for i in 3..<arr.count {
        dp.append(max(dp[i-1], dp[i-2]) + arr[i])
    }
    print(dp.max()!)
}

solution()
