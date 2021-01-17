import Foundation

var testCase: Int = Int(readLine()!)!
var arr: [[Int]] = [[Int]]()
let dX: [Int] = [-1,1,0,0]
let dY: [Int] = [0,0,-1,1]
var width: Int
var height: Int
var result: [Int] = Array(repeating: 0, count: testCase)
var count: Int = 0
for l in 0..<testCase {
    let info: [Int] = readLine()!.split(separator: " ").map{ Int($0)!}
    width = info[0]
    height = info[1]
    let number: Int = info[2]
    arr = Array(repeating: Array(repeating: 0, count: width), count: height)
    for _ in 0..<number {
        let place: [Int] = readLine()!.split(separator: " ").map{ Int($0)!}
        arr[place[1]][place[0]] = 1
    }
    print(arr)
    for i in 0..<height {
        for j in 0..<width {
            if arr[i][j] == 1 {
                bfs(width, height, i, j)
                print(i, j, "result plus")
                result[l] = result[l] + 1
            }
        }
    }
}
var check: [[Int]] =  [[Int]]()
var visited: [[Int]] = [[Int]]()
func bfs(_ width: Int, _ height: Int, _ startX: Int, _ startY: Int){
    
    arr[startX][startY] = 0
    visited = [[startX, startY]]
    check = [[startX, startY]]
    while !check.isEmpty {
        let popV: [Int] = check.popLast()!
        print("\n", popV[0], popV[1], "pop")
        print(arr)
        print(visited, "visited")
        print("check", check)
        for i in 0...3 {
            let newX: Int = popV[0]+dX[i]
            let newY: Int = popV[1]+dY[i]
            print(newX, newY, "new")
            if width > newX && newX >= 0 && height > newY && newY >= 0 {
                print(newX, newY, "new range is OK")
                print(arr[newY][newX], visited.contains([newX, newY]))
                if arr[newY][newX] == 1 && !(visited.contains([newX, newY])){
                    print(newY, newX,  "1값입니다")
                    check.append([newX, newY])
                    visited.append([newX, newY])
                    arr[newY][newX] = 0
                    print(arr)
                }
            }
        }
    }
}

print(result)
