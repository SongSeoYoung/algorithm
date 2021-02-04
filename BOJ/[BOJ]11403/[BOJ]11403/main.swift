import Foundation

let node: Int = Int(String(readLine()!))!
var result: [[Int]] = [[Int]]()
var tree: [[Int]] = [[Int]]()
for _ in 0..<node {
    tree.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
result = tree

func dfs(_ startH: Int) {
    for width in 0..<node {
        if !dfsVisited.contains(width) && tree[startH][width] == 1 {
            dfsVisited.append(width)
            dfs(width)
        }
    }
}
var dfsVisited = [Int]()
for height in 0..<node {
    dfsVisited = [Int]()
    dfs(height)
    for width in 0..<node {
        if result[height][width] == 0 && dfsVisited.contains(width){
            result[height][width] = 1
        }
    }
}

for i in 0..<node {
    for j in 0..<node {
        print(result[i][j], terminator: " ")
    }
    print("")
}
