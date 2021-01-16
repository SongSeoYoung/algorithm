import Foundation

let size: Int = Int(readLine()!)!
var arr: [[String]] = [[String]]()
for _ in 0..<size {
    let arr1: [String] = readLine()!.map{ String($0) }
    arr.append(arr1)
}

var realCount: Int = 0
var count: Int = 0
let directionX: [Int] = [0, 0, -1, 1]
let directionY: [Int] = [-1,1,0,0]
var visited: [[Int]] = [[Int]]()
func bfs() {
    for i in 0..<size {
        
    }
}
