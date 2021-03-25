import Foundation

func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    //n 정보만큼 배열 만들기 [기둥, 보]
    var arr = Array(repeating: Array(repeating: [false, false], count: n+1), count: n+1)
    for i in 0..<build_frame.count {
        print("")
        print(arr)
        let x = build_frame[i][0]
        let y = 5 - build_frame[i][1]
        var 기둥 = true
        if build_frame[i][2] == 1 {
            기둥 = false
        }
        var remove: Bool = false
        if build_frame[i][3] == 0 {
            remove = true
        }
        
        print(y, x, "기둥", 기둥, "remove", remove)
        
        if 기둥 {
            //설치
            if !remove{
                //설치조건 : 바닥위에 있거나 , 보의 한쪽 끝에 있거나, 또 다른 기둥위에있어야된다.
                if 기둥설치조건(x: x, y: y, arr: arr, n:n){
                    arr[y][x][0] = true
                }
            }
            // 삭제
            if remove {
                arr[y][x][0] = false
                if !checkAll(x: x, y: y, arr: arr, n: n) {
                    arr[y][x][0] = true
                }
            }
        }
        
        
        //보
        else if !기둥 {
            if !remove {
                // 한쪽 끝이 기둥 위에 있거나 양쪽 끝이 보에 연결되어있는 경우
                if 보설치조건(x: x, y: y, arr: arr, n: n){
                    arr[y][x][1] = true
                }
            }
            if remove {
                // 나를 지워도 양쪽 보가 만족하는지 검사한다.
                arr[y][x][1] = false
                if !checkAll(x: x, y: y, arr: arr, n: n) {
                    arr[y][x][1] = true
                }
            }
        }
    }
    print(arr)
    return []
}

func 보설치조건(x: Int, y: Int, arr: [[[Bool]]], n: Int) -> Bool {
    if y + 1 <= n {
        if arr[y+1][x][0] {
            return true
        }
        if x + 1 <= n {
            if arr[y+1][x+1][0] {
                return true
            }
        }
    }
    if x - 1 >= 0 && x + 1 <= n{
        if ( arr[y][x-1][1] && arr[y][x+1][1] ) {
            return true
        }
    }
    return false
}
func 기둥설치조건(x:Int, y: Int, arr: [[[Bool]]], n: Int) -> Bool {
    if y == 5 {
        return true
    }
    if x + 1 <= n {
        if arr[y][x+1][1] {
            return true
        }
    }
    if x - 1 >= 0 {
        if arr[y][x-1][1] {
            return true
        }
    }
    if y + 1 <= n {
        if arr[y+1][x][0] {
            return true
        }
    }
    return false
}
func checkAll(x: Int, y: Int, arr: [[[Bool]]], n: Int) -> Bool {
    if y + 1 <= n {
        if !기둥설치조건(x: x, y: y+1, arr: arr, n: n) {
            return false
        }
    }
    if  y - 1 >= 0 {
        if !기둥설치조건(x: x, y: y-1, arr: arr, n: n) {
            return false
        }
    }
    if x + 1 <= n {
        if !보설치조건(x: x, y: y, arr: arr, n: n) {
            return false
        }
    }
    if x - 1 >= 0 {
        if !보설치조건(x: x, y: y, arr: arr, n: n) {
            return false
        }
    }
    return true
}


solution(5, [[0,0,0,1],[2,0,0,1],[4,0,0,1],[0,1,1,1],[1,1,1,1],[2,1,1,1],[3,1,1,1],[2,0,0,0],[1,1,1,0],[2,2,0,1]])
