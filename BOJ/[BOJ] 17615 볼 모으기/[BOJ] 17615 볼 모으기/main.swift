func solution() {
    let number = Int(readLine()!)!
    var arr = Array(readLine()!).map { String($0) }
    var rcount = 0
    var bCount = 0
    arr.forEach {
        if $0 == "R" {
            rcount += 1
        } else if $0 == "B" {
            bCount += 1
        }
    }
    var choice = min(rcount, bCount)
    var leftBall = 0
    for i in 0..<arr.count {
        if arr[0] != arr[i] { break }
        leftBall += 1
    }
    if arr[0] == "R" {
        leftBall = rcount - leftBall
        choice = min(leftBall, choice)
    }else {
        leftBall = bCount - leftBall
        choice = min(leftBall, choice)
    }
    var rightBall = 0
    for i in stride(from: arr.count - 1, to: 0, by: -1) {
        if arr[i] != arr[arr.count - 1] { break }
        rightBall += 1
    }
    if arr[arr.count - 1] == "R" {
        rightBall = rcount - rightBall
        choice = min(rightBall, choice)
    }else {
        rightBall = bCount - rightBall
        choice = min(rightBall, choice)
    }
    
    print(choice)
}

solution()
