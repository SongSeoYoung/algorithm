import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var arr: [[Int]] = Array(repeating: Array(repeating: 0 , count: board[0].count), count: board[0].count)
    var result: [Int] = [Int]()
    var cnt: Int = 0
    for j in 0..<board[0].count {
        for i in 0..<board[j].count {
            arr[j][i] = board[i][j]
        }
    }
    for i in 0..<moves.count {
        for j in 0..<board[0].count {
            if arr[moves[i]-1][j] != 0 {
                if result.count > 0 {
                    if result.last == arr[moves[i]-1][j] {
                        cnt += 2
                        result.popLast()
//                        print(result, "\result")
                    } else{
                        result.append(arr[moves[i]-1][j])
//                        print(result, "rsult")
                    }
                } else{
                    result.append(arr[moves[i]-1][j])
                }
                arr[moves[i]-1][j] = 0
                break
            }
        }
    }
   
    return cnt
    
}
print(solution([[0,2,0],[1,2,0],[2,2,1]], [1,2,2,2,1,3]))
