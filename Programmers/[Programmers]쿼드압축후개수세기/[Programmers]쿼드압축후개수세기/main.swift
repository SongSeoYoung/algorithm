import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var arrList = arr
    var result = [0,0]
    for h in 0..<arrList.count {
        for w in 0..<arrList.count {
            if w % 2 == 0 {
                // 이미 묶인건지 확인 (0이나 1이여야지 아직 묶인게 아니다)
                if arrList[h][w] == 0 || arrList[h][w] == 1 {
                    print("dfs로 ", h, w,"가 들어감")
                    if dfs(h: h, w: w, arr: arrList) {
                        print("dfs 로 같은 숫자를 찾았어요")
                        if arrList[h][w] == 1 {
                            result[1] += 1
                        }else { result[0] += 1 }
                        arrList[h][w] = -1
                        arrList[h+1][w] = -1
                        arrList[h][w+1] = -1
                        arrList[h+1][w+1] = -1
                    }
                }else{
                    
                }
            }

        }
    }
    for h in 0..<arrList.count {
        for w in 0..<arrList.count {
            if arrList[h][w] != -1 {
                result[arrList[h][w]] += 1
            }
        }
    }
    return result
}
func dfs(h: Int, w: Int, arr: [[Int]]) -> Bool {
    let dx = [0,1,1]
    let dy = [1,0,1]
    let originV = arr[h][w]
    var flag = [false,false, false]
    for i in 0..<dx.count {
        let newH = h + dy[i]
        let newW = w + dx[i]
        if newH<arr.count && newW < arr.count {     //범위체크
            print(newH, newW, "newH, newW")
            if arr[newH][newW] == originV {
                flag[i] = true
            }else{
                flag[i] = false
            }
        }
    }
    return flag[0] && flag[1] && flag[2]
}

print(solution([[1,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,1,1,1,1],[0,1,0,0,1,1,1,1],[0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,1],[0,0,0,0,1,0,0,1],[0,0,0,0,1,1,1,1]]))
