import Foundation

var info:[Int] = Array(readLine()!.split(separator: " ")).map{ Int(String($0))! }
var width: Int = info[0]
var height: Int = info[1]
var arr: [[Character]] = [[Character]]()

for _ in 0..<height {
    arr.append(Array(readLine()!))
}
var sum: [Int] = [0,0]
let dx: [Int] = [0,0,-1,1]
let dy: [Int] = [1,-1,0,0]
var visited: [[Int]] = [[Int]]()
var eachSum: [Int] = [0,0]
func dfs(startH: Int, startW: Int) {
    visited.append([startH, startW])        //dfs 들어온 곳은 무조건 들어왔다고 체크해주기
    for i in 0..<4 {        //상하좌우 검사
        let newW: Int = startW + dx[i]
        let newH: Int = startH + dy[i]
        if newW < width && newW >= 0 && newH < height && newH >= 0 {        //범위 검사
            //내가 W 인데 상하좌우 중 새로운 좌표도 나랑 같으면서 방문한 적 없다면
            if arr[startH][startW] == "W" && arr[newH][newW] == "W" && !visited.contains([newH, newW]) {
                eachSum[0] += 1     //나랑 같은 것 갯수를 추가해주기
                dfs(startH: newH, startW: newW)     //새로운 좌표에 대해서 또 어디까지 나랑 같은지를 참고하기위해 dfs 돌려주기
            }
            //위와 같은 방법
            if arr[startH][startW] == "B" && arr[newH][newW] == "B" && !visited.contains([newH, newW]) {
                eachSum[1] += 1
                dfs(startH: newH, startW: newW)
            }
        }
    }
    //결국 이 dfs 를 탈출하는 것은 상하좌우를 다 검사했는데 나랑 같은게 없거나 다 방문한 경우에,
}

for h in 0..<height {
    for w in 0..<width {
        if !visited.contains([h,w]) {
            eachSum = [0,0]
            if arr[h][w] == "W" {
                eachSum[0] += 1
            } else {
                eachSum[1] += 1
            }
            //이게 실행되는 것은 방문한 적이 없는 곳에 대해서만!!
            dfs(startH: h, startW: w)
            for i in 0..<2 {
                sum[i] += eachSum[i] * eachSum[i]
            }
        }
    }
}
for i in sum {
    print(i, terminator: " ")
}
