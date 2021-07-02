func solution() {
    var line = readLine()!.split(separator: " ").map { Int(String($0))! }
    var n = line[0]
    var k = line[1]
    
    var narr: [Int] = [Int]()
    var karr: [Int] = [Int]()
    
    for i in 0..<n {
        var line = readLine()!.split(separator: " ").map { Int(String($0))! }
        narr.append(line[0])
        karr.append(line[1])
    }
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: k), count: n)
    for i in 0..<n{
        for w in 0..<k {
            if w >= narr[i] {
                if i == 0 { dp[i][w] = narr[i] }
                else {
                    if w < narr[i] { dp[i][w] = dp[i-1][w]}
                    else { dp[i][w] = max(dp[i-1][w], dp[i][w - narr[i]] + narr[i]) }
                }
            }
        }
    }
    print(dp[n-1][k-1])
    
}
solution()

/*
 4 7
 6 13
 4 8
 3 6
 5 12
 */

/*
 5 10
 1 1
 1 2
 1 3
 1 4
 1 5
 15
 */
