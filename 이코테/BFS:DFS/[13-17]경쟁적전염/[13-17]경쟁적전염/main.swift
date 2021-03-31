import Foundation

func solution()  -> Int{
    let arrsize = readLine()!.split(separator: " ").map { Int(String($0))! }
    let height = arrsize[0]
    let width = arrsize[1]
    var arr = Array(repeating: Array(repeating: 0, count: width + 1), count: height + 1)
    for i in 1...height{
        var list = [0]
        list.append(contentsOf: readLine()!.split(separator: " ").map { Int(String($0))! })
        arr[i] = list
    }
    
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var nowVisited = [[Int]]()
    var visited = [[Int]]()
    func bfs(y: Int, x: Int) {
        let dirY = [1, -1, 0, 0]
        let dirX = [0,0,-1,1]
        for i in 0..<4 {
            let newY = y + dirY[i]
            let newX = x + dirX[i]
            // 범위에 맞다면
            if checkRange(x: newX, y: newY, height: height, width: width) && !(visited.contains([newY, newX])) {
                if arr[newY][newX] == 0 {       //근데 첫 값이 없으면 그냥 나를 넣음
                    arr[newY][newX] = arr[y][x]
                }
                else{       //이미 값이 있다면 더 작은 값을 넣어야겠지?
                    arr[newY][newX] = min(arr[newY][newX], arr[y][x])
                }
                nowVisited.append([newY, newX])
            }
        }
    }
    
    
    for _ in 0..<info[0] {
        for i in 1...height {
            for j in 1...width {
                if arr[i][j] != 0 && !nowVisited.contains([i, j]){
                    visited.append([i, j])
                    bfs(y: i, x: j)
                }
            }
        }
        visited.append(contentsOf: nowVisited)
        nowVisited = [[Int]]()
    }
    print(arr)
    return arr[info[1]][info[2]] == 0 ? 0 :  arr[info[1]][info[2]]
}

func checkRange(x: Int, y: Int, height: Int, width: Int) -> Bool {
    if 1...height ~= y && 1...width ~= x {
        return true
    }
    return false
}


func solution2() -> Int{
    let arrsize = readLine()!.split(separator: " ").map { Int(String($0))! }
    let height = arrsize[0]
    let width = arrsize[1]
    var arr = Array(repeating: Array(repeating: 0, count: width + 1), count: height + 1)
    var data = [[Int]]()
    for i in 1...height{
        var list = [0]
        list.append(contentsOf: readLine()!.split(separator: " ").map { Int(String($0))! })
        arr[i] = list
        //데이터가 있따면 미리 기록해두기
        for j in 1...width {
            if arr[i][j] != 0 {
                data.append([arr[i][j], 0, i, j])
            }
        }
    }
    
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    data.sort { (int1, int2) -> Bool in
        int1[0] < int2[0]
    }
    let dirY = [1, -1, 0, 0]
    let dirX = [0,0,-1,1]
    
    while !data.isEmpty {
        let dir = data.remove(at: 0)
        let virus = dir[0]
        let s = dir[1]
        let y = dir[2]
        let x = dir[3]
        if s == info[0] {
            break
        }
        for i in 0..<4 {
            let newY = y + dirY[i]
            let newX = x + dirX[i]
            
            if checkRange(x: newX, y: newY, height: height, width: width) {
                if arr[newY][newX] == 0 {
                    arr[newY][newX] = virus
                    data.append([virus, s+1, newY, newX])
                }
            }
        }
    }
    print(arr)
    return arr[info[1]][info[2]] == 0 ? 0 : arr[info[1]][info[2]]
}

print(solution2())
