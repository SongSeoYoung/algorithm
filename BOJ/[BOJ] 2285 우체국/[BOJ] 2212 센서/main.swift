import Foundation

func solution() -> Int {
    let n = Int(readLine()!)!
    var arr: [[Int]] = .init()
    for _ in 0..<n {
        let a = readLine()!.split(separator: " ").map { Int($0)! }
        arr.append(a)
    }
    if n == 1 {
        return arr[0][0]
    }
    arr.sort { a, b in
        a[0] < b[0]
    }
    
    var start = arr.first![0]
    var end = arr.last![0]
    
    var answer = Int.max  // 우체국까지 거리
    var answerIndex = Int.max  // 우체국 위치
    
    while (start <= end) {
        let middle = ( start + end ) / 2
        var total = 0
        
        var 앞 = 0
        var 뒤 = 0
        
        arr.forEach { a in
            if a[0] - middle < 0 {
                앞 += a[1]
            } else if a[0] - middle > 0 {
                뒤 += a[1]
            }
            total += abs(a[0] - middle) * a[1]
        }

        if answer > total {
            answer = total
            answerIndex = middle
        } else if answer == total {
            answerIndex = min(answerIndex, middle)
        }
        if 앞 > 뒤 {
            end = middle - 1
        } else {
            start = middle + 1
        }
    }
    return answerIndex
}

print(solution())
