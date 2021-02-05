import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var computersArr: [[Int]] = computers
    var visited: [[Int]] = [[Int]]()
    var netWork: [Int] = [Int]()
    
    func dfs(startH: Int, startW: Int) {
        visited.append([startH, startW])
        netWork.append(startH)
    
        for i in 0..<n {
                if computersArr[startW][i] == 1 && !visited.contains([startW,i]) {
                    computersArr[startW][i] = 0
                    dfs(startH: startW, startW: i)
                }
            }
        }
    
    var cnt: Int = 0
    for h in 0..<n {
        for w in 0..<n {
            if computersArr[h][w] == 1 && !visited.contains([h,w]) {
                dfs(startH: h, startW: w)
                cnt += 1
                for i in 0..<n{
                    if i==n-1 && netWork.contains(i) {
                        break
                    }
                }
            }
        }
    }
//    print(cnt)
    return cnt
}

print(solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]]))
