func solution() -> Int {
    let cardN = Int(readLine()!)!
    var list = [Int]()
    for _ in 0..<cardN {
        list.append(Int(String(readLine()!))!)
    }
//    var sum = 0
//    while list.count >= 2 {
//        let pop1 = list.remove(at: 0)
//        let pop2 = list.remove(at: 0)
//        sum += pop1 + pop2
//        list.append(pop1 + pop2)
//    }
//    var adding = list[0] + list[1]
//    for i in 2..<list.count {
//        list[i] += adding
//        adding = list[i]
//    }
    var sum = 0
    while list.count >= 2 {
        list.sort()
        let pop1 = list.remove(at: 0)
        let pop2 = list.remove(at: 0)
        list.append(pop1 + pop2)
        sum += pop1 + pop2
    }
    return sum
}
print(solution())
