import Foundation

let number: Int = Int(String(readLine()!))!
var arr: [[Int]] = [[Int]]()
for _ in 0..<number {
    arr.append(Array(readLine()!).map{ Int(String($0))! })
}
var count: Int = 0
let dx = [0,0,-1,1]
let dy = [1,-1,0,0]
var visited:[[Int]] = [[Int]]()

var apartCount: Int = 0

func dfs(startH: Int, startW: Int) {
    visited.append([startH, startW])
    if arr[startH][startW] == 1 {
        apartCount += 1
    }
    for i in 0..<4 {
        let newH = startH + dy[i]
        let newW = startW + dx[i]
        if newH < number && newH >= 0 && newW < number && newW >= 0 {
            if arr[newH][newW] == 1 && !visited.contains([newH, newW]) {
                
                dfs(startH: newH, startW: newW)
            }
        }
    }
}

var result: [Int] = [Int]()
for height in 0..<number {
    for width in 0..<number {
        if arr[height][width] == 1 && !visited.contains([height, width]) {
            dfs(startH: height, startW: width)
            result.append(apartCount)
            apartCount = 0
        }
    }
}
print(result.count)
result.sort()
for i in result{
    print(i)
}
