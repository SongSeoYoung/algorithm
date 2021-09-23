func check(current: Int, arr: [Int]) -> Int {
    var start = 0
    var end = arr.count - 1
    while start <= end {
        let mid = (start + end ) / 2
        if arr[mid] <= current {
            start = mid + 1
        }
        else {
            end = mid - 1
        }
    }
    return arr.count - (end + 1)
}


func solution() {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let len = info[0]
    let height = info[1]

    var a: [Int] = []
    var b: [Int] = []

    for i in 0..<len {
        let _info = Int(readLine()!)!
        if i % 2 == 0 {
            a.append(_info)
        } else {
            b.append(_info)
        }
    }
    a.sort()
    b.sort()

    var answer = Int.max
    var answerCount = 0
    
    for i in 0..<height {
        let aCount = check(current: i, arr: a)
        let bCount = check(current: height - 1 - i, arr: b)
        let finalCount = aCount + bCount
        
        if finalCount < answer {
            answer = finalCount
            answerCount = 1
        }
        else if finalCount == answer {
            answerCount += 1
        }
    }
    print(answer, answerCount)
}

solution()
