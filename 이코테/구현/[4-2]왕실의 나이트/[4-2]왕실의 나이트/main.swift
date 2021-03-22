/*
 상하좌우로 움직이는 dfs, bfs문제랑 비슷했다.
 다만 a로 들어오는 값 때문에 switch case 문을 이용해서 숫자로 변환시켜주었다.
 좀 더 머리를 서본다면 uniicode를 사용하면 코드 자체의 길이가 더 짧아질 수도 있겠다고 생각했다.
 */

import Foundation

func solution() -> Int{
    let info = Array(readLine()!).map { String($0)}
    let W = findNumber(alpha: info[0])
    let H = Int(info[1])! - 1
    var count = 0
    let dirW = [2,2, -2,-2,1,1, -1,-1]
    let dirH = [1, -1, 1, -1,2,-2, 2, -2 ]
    for i in 0..<dirW.count{
        let newW = dirW[i] + W
        let newH = dirH[i] + H
        //범위체크
        if checkRange(newW) && checkRange(newH) {
            count += 1
        }
    }
    return count
}
func checkRange(_ a: Int) -> Bool {
    if 0...7 ~= a {
        return true
    }
    else{
        return false
    }
}

func findNumber(alpha: String) -> Int {
    switch alpha {
    case "a":
        return 0
    case "b":
        return 1
    case "c":
        return 2
    case "d":
        return 3
    case "e":
        return 4
    case "f":
        return 5
    case "g":
        return 6
    case "h":
        return 7
    default:
        return -1
    }
}

print(solution())
