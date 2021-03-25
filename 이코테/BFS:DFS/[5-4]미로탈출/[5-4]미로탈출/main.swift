import Foundation

func solution() -> Int {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    var arr: [[Int]] = Array(repeating: [], count: info[0])
    for i in 0..<info[0] {
        arr[i] = Array(readLine()!).map { Int(String($0))! }
    }
    var visited = [[Int]]()
    let dirX = [0,1]
    let dirY = [1,0]
    var count = 0
    func dfs(x: Int, y: Int) {
        count += 1
        if x == info[1] - 1 && y == info[0] - 1{
            return
        }
        visited.append([x, y])
        for i in 0..<2 {        //하우
            let newY = y + dirY[i]
            let newX = x + dirX[i]
            if checkRange(x: newX, y: newY, rangeX: info[1], rangeY: info[0]) {
                if arr[newY][newX] == 1 && (!visited.contains([newX, newY])){
                    arr[newY][newX] = 0
                    dfs(x: newX, y: newY)
                }
            }
        }
    }
    dfs(x: 0, y: 0)
    return count
}
func checkRange(x: Int, y: Int, rangeX: Int, rangeY: Int) -> Bool {
    if (0..<rangeY ~= y) && (0..<rangeX ~= x) {
        return true
    }
    return false
}

print(solution())

/*
 교재에서는 bfs로 풀엇따. 나는 dfs로 구현했음.
 1을 탐색하는 문제이기도하지만 어떻게보면 최단거리를 구해야하는 문제로 볼 수도 있다.
 그래서 하 우 로만 움직이게 만들었다. 또 순서를 하를 먼저 실행하므로 목적지가 밑에있으니 하가 우선실행되어지고, 이렇게 이어지다가 최종지점에 닿으면 함수 자체를 return시켜버렸다. 그런데 문제가 있을 듯하다. 아래의 예시에만 해당되는 코드인듯..
 
 교재를 보니 bfs가 더 효율적일 것 같다는 생각도 들었다.
 
 */
