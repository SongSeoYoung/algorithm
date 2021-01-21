import Foundation

func solution(_ n:Int) -> [Int] {
    var arr: [[Int]] = [[Int]]()
    var total: Int = 0
    for i in 1...n {
        let li: [Int] = Array(repeating: 0, count: i)
        arr.append(li)
        total = total + i
    }
//    print(total)
    var cnt: Int = 1
    var down: Int = 0
    var side: Int = 1
    var downStart: Int = 0
    var sideCheck: Int = 1
    var up: Int = 1
    var upChecking: Int = 0
    var sideMax: Int = 0
    var upMax: Int = 1
    while true{
//        print(arr)
//        print(cnt)
        if cnt == total - 1 {
            break
        }

        //내려가기
        for i in downStart..<n {
            
            if arr[i][down] == 0 {
                arr[i][down] = cnt
                cnt = cnt + 1
//                print(cnt)
                if cnt == total + 1 {
                    break
                }
                //옆으로 채우기
                if i == n-sideCheck {
                    for s in side..<n - sideMax{
                        if arr[i][s] == 0 {
                            arr[i][s] = cnt
                            cnt = cnt + 1
//                            print(cnt)
                        }
                    }
                }
            }
        }
//        print(arr)
        //올라가기
        if cnt == total + 1{
            break
        }
        for i in 1..<n - upMax {
            if arr[n-up-i].endIndex - 1 - upChecking <= arr[n - up - i].endIndex - 1 && arr[n-up-i].endIndex - 1 - upChecking >= 0{
                if arr[n - up - i][arr[n - up - i].endIndex - 1 - upChecking] == 0 {
                    arr[n - up - i][arr[n - up - i].endIndex - 1 - upChecking] = cnt
                    cnt = cnt + 1
    //                print(cnt)
                    if cnt == total + 1 {
                        break
                    }
                }

            }
        }
        
        downStart = downStart + 2
        down = down + 1
        sideCheck = sideCheck + 1
        side = side + 1
        up = up + 1
        upChecking = upChecking + 1
        sideMax = sideMax + 1
        upMax = upMax + 1
    }
    var result: [Int] = [Int]()
    for i in 0..<n {
        let li: [Int] = arr[i]
        for l in li{
            result.append(l)
        }
    }
    return result
}

print(solution(10))

