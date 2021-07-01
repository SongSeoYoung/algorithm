func solution() {
    var line = readLine()!.split(separator: " ").map { Int(String($0))! }
    var n = line[0]
    var k = line[1]
    
    var narr: [Int] = [Int]()
    var karr: [Int] = [Int]()
    
    for i in 0..<n {
        var line = readLine()!.split(separator: " ").map { Int(String($0))! }
        narr.append(line[0])
        karr.append(line[1])
    }
    var findMax: [Int] = [Int]()
    for i in 0..<n {
        var answer = 0
        var total = k
        total -= narr[i]
        answer += karr[i]
        for j in 0..<n {
        
            if j != i {
                if total == 0 { break }
                else if total >= narr[j] {
                    total -= narr[j]
                    answer += karr[j]
                }
                else { continue }
            }
        }
       if total == 0{
            findMax.append(answer)
        }
    }
    print(findMax.max() != nil ? findMax.max()! : 0)
}
solution()
