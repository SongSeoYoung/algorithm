import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var computersArr = computers
    var visited: [[Int]] = [[Int]]()
    var count: Int = 0
    print("dd")
    print(dfs(startH: 0, computer: n, computers: computers, visited: visited))
   

//    for i in 0..<n {
//        print(computersArr[i], "여기에 1이 포함되어있나요?")
//        if computersArr[i].contains(1) {
//            count += 1
//            dfs(startH: i, computer: n, computers: computersArr, visited: visited)
//        }
//    }
    return count
}

func dfs(startH: Int, computer: Int, computers: [[Int]], visited: [[Int]]) -> [[Int]] {
    var computersCopy: [[Int]] = computers
    var visitedCopy: [[Int]] = visited
    for width in 0..<computer {
        if computers[startH][width] == 1 && !visited.contains([startH, width]) {
            computersCopy[startH][width] = 0
            visitedCopy.append([startH, width])
            print(computersCopy, "e")
            dfs(startH: width, computer: computer, computers: computersCopy, visited: visitedCopy)
        }
    }
    return computersCopy
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
