import Foundation

var arr = Array(repeating: Array(repeating: [0,0,0,0], count: 11), count: 11)
func solution(_ dirs:String) -> Int {
    let info = Array(dirs)

    var x = 5
    var y = 5
    var count = 0
    for i in 0..<info.count {
        print("---------------------------")
        print(info[i], "new start")
        print(x, y, "x, y")
        
        if info[i] == "L" && rangeCheck(x: x - 1, y: y) {
            arr[x][y][0] = 1
            x = x - 1
            if !isVisited(x: x, y: y, dir: 2) {
                count += 1
            }
            arr[x][y][2] = 1
        }else if info[i] == "U" && rangeCheck(x: x, y: y-1) {
            arr[x][y][1] = 1
            y -= 1
            if !isVisited(x: x, y: y, dir: 3) {
                count += 1
            }
            arr[x][y][3] = 1
        }else if info[i] == "R" && rangeCheck(x: x+1, y: y) {
            arr[x][y][2] = 1
            x += 1
            if !isVisited(x: x, y: y, dir: 0) {
                count += 1
            }
            arr[x][y][0] = 1
        }else if info[i] == "D" && rangeCheck(x: x, y: y+1) {
            arr[x][y][3] = 1
            y += 1
            if !isVisited(x: x, y: y, dir:1) {
                count += 1
            }
            arr[x][y][1] = 1
        }
        print(x, y, "after x y")
        print(count, "now count")
    }
    return count
}

func rangeCheck(x: Int, y: Int) -> Bool {
    if x >= 0 && x <= 9 && y >= 0 && y <= 9 {
        return true
    }else{
        return false
    }
}

func isVisited(x: Int, y: Int, dir: Int) -> Bool {
    if arr[x][y][dir] == 1{      //방문한 적이 있다.
        return true
    } else {
        return false
    }
}

print(solution("RRRRLLLLRRRRUUUUUDDDDRDDDD"))
