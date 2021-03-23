func solution() -> String{
    let n = Array(readLine()!)

    let minIndex = n.count / 2
    var frontSum = 0
    for i in 0..<minIndex {
        frontSum += Int(String(n[i]))!
    }
    for j in minIndex..<n.count {
        frontSum -= Int(String(n[j]))!
    }
    return frontSum == 0 ? "LUCKY" : "READY"
}

print(solution())
