import Foundation

let number: Int = Int(readLine()!)!
let array: [Int] = Array(readLine()!.split(separator: " ")).map{ Int($0)! }
var dp: [Int] = Array(repeating: 0, count: number)
dp[0] = 1
for i in 1..<number {
    var check: Int = 0
    for j in 0..<i {
        if dp[j] > check && array[j] < array[i] {
            check = dp[j]
        }
    }
    dp[i] = check + 1
}
dp.sort()
print(dp[dp.count - 1])
