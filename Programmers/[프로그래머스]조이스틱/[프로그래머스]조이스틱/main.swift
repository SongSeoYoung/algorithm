import Foundation
/* 내 솔루션
func solution(_ name:String) -> Int {
    let front: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
    let back: [Character] = ["Z", "Y", "X", "W", "V", "U", "T", "S", "R", "Q", "P", "O", "N"]
    var arr = Array(name)
    var count = 0
    var countArr = Array(repeating: 0, count: arr.count)
    for i in 0..<arr.count {
        if front.contains(arr[i]) {
//            count += front.firstIndex(of: arr[i])!
            countArr[i] = front.firstIndex(of: arr[i])!
        } else {
//            count += (back.firstIndex(of: arr[i])! + 1)
            countArr[i] = (back.firstIndex(of: arr[i])! + 1)
        }
    }
    
    var left = 0
    for i in 0..<arr.count - 1 {
        if arr[i+1] == "A" && (arr.count - 1  - i > 1 + i) {
            //왼쪽으로가는게 이득임.
            left += 1
        }
    }
    var moveArr = Array(repeating: 0, count: arr.count)
    var index = 0
    while true {
        if index+1 < arr.count && arr[index+1] == "A" && (arr.count - 1  - index > 1 + index) {
            //왼쪽으로가는게 이득임.
            moveArr[index] += 1
            if index == 0 { index = arr.count - 1 }
            index -= 1
        }else {
            if index == arr.count - 1 { break }
            else {
                index += 1
                moveArr[index] += 1
            }
        }
    }
    print(moveArr)
    return count
}

print(solution("JAAANE"))
*/

// 구글링


func solution(_ name:String) -> Int {
    var arr = Array(name)
    let front: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M"]
    let back: [Character] = ["Z", "Y", "X", "W", "V", "U", "T", "S", "R", "Q", "P", "O", "N"]
    var answer = 0
    var len = name.count
    var directionCount = len - 1
    
    for i in 0..<len {
        var nextIndex = i + 1
        if front.contains(arr[i]) {
            answer += front.firstIndex(of: arr[i])!
        } else {
            answer += (back.firstIndex(of: arr[i])! + 1)
        }
        
        while nextIndex < len && arr[nextIndex] == "A" {
            nextIndex += 1
        }
        directionCount = min(directionCount, i+i+len - nextIndex)
    }
    answer += directionCount
    return answer
}
print(solution("JAN"))
