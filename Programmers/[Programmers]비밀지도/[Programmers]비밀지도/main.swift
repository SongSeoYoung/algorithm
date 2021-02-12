func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    var sum: [[String]] = Array(repeating: Array(repeating: " ", count: n), count: n)
    
    var arr1String: [[Character]] = Array(repeating: [], count: n)
    var arr2String: [[Character]] = Array(repeating: [], count: n)
    for i in 0..<arr1.count{
        var addingString: String = ""
        if Array(String(arr1[i], radix: 2)).count < n {
            for _ in 0..<n - Array(String(arr1[i], radix: 2)).count {
                addingString += "0"
            }
        }
        arr1String[i] = Array(addingString) + Array(String(arr1[i], radix: 2))
        addingString = ""
        if Array(String(arr2[i], radix: 2)).count < n {
            for _ in 0..<n - Array(String(arr2[i], radix: 2)).count {
                addingString += "0"
            }
        }
        arr2String[i] = Array(addingString) + Array(String(arr2[i], radix: 2))
    }
//    print(arr1String)
//    print(arr2String)
    for h in 0..<n {
        for w in 0..<n {
            if arr1String[h][w] == "1" || arr2String[h][w] == "1" {
                sum[h][w] = "#"
            }
        }
    }
//    print(sum)
    for i in 0..<n {
        var str: String = ""
        for w in 0..<n {
            str += sum[i][w]
        }
        answer.append(str)
    }
    return answer
}

print(solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10]))
