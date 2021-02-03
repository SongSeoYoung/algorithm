import Foundation

let number: Int = Int(readLine()!)!
let arr: [Int] = Array(readLine()!.split(separator: " ")).map{ Int($0)!}
var dp: [Int] = Array(repeating: 0, count: number)
dp[0] = arr[0]
for i in 1..<number {
    dp[i] = max(dp[i-1] + arr[i] , arr[i])
}
dp.sort()
print(dp[dp.count - 1])
