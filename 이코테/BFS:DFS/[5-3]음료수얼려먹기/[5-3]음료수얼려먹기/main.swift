/*
 dfs 상하좌우 문제
 */

import Foundation
func solution() -> Int{
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    var arr: [[Int]] = Array(repeating: [], count: info[0])
    for i in 0..<info[0] {
        arr[i] = (Array(readLine()!).map{ Int(String($0))!})
    }
    var visited = [[Int]]()
    let dirX = [0,0,1,-1]
    let dirY = [1,-1,0,0]
    func dfs(x: Int, y: Int) {
        visited.append([x, y])
        for i in 0..<4 {        //상하우좌
            let newY = y + dirY[i]
            let newX = x + dirX[i]
            if checkRange(x: newX, y: newY, rangeX: info[1], rangeY: info[0]) {
                if arr[newY][newX] == 0 && (!visited.contains([newX, newY])){
                    arr[newY][newX] = 1
                    dfs(x: newX, y: newY)
                }
            }
        }
    }
    var count = 0
    for h in 0..<info[0] {
        for w in 0..<info[1] {
            if arr[h][w] == 0 {
                arr[h][w] = 1
                count += 1
                dfs(x: w, y: h)
            }
        }
    }
    return count
    
}
func checkRange(x: Int, y: Int, rangeX: Int, rangeY: Int) -> Bool {
    if (0..<rangeY ~= y) && (0..<rangeX ~= x) {
        return true
    }
    return false
}

print(solution())
