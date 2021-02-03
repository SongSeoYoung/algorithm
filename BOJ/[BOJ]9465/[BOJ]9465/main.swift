import Foundation

let testCase: Int = Int(readLine()!)!
var result: [Int] = [Int]()
for _ in 0..<testCase {
    let number: Int = Int(readLine()!)!
    var array: [[Int]] = [[Int]]()
    for _ in 0..<2 {
        array.append(Array(readLine()!.split(separator: " ")).map{ Int($0)! })
    }
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: number), count: 2)
    dp[0][0] = array[0][0]
    dp[1][0] = array[1][0]
    for width in 1..<number{
        for i in 0..<2 {
            if i == 0 {
//                print("윗줄")
                dp[i][width] = max(dp[i][width - 1], dp[i+1][width-1] + array[i][width])
            } else {
//                print("아랫줄")
                dp[i][width] = max(dp[i][width - 1], dp[i-1][width-1] + array[i][width])
            }
        }
    }
    var check: [Int] = [dp[0][number-1], dp[1][number-1]]
    check.sort()
    result.append(check[1])
}
for i in result {
    print(i)
}
