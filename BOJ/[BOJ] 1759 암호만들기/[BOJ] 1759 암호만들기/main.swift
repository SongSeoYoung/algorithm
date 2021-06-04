func solution() {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let L = info[0]
    let C = info[1]
    let Carr = readLine()!.split(separator: " ").map { String($0) }
    var mo = ["a", "e", "i", "o", "u"]
    var english = ["mo", "ja"]
    var count = Array(repeating: [], count: 2)
    for i in 0..<Carr.count {
        if mo.contains(Carr[i]) {
            count[0].append(Carr[i])
        } else {
            count[1].append(Carr[i])
        }
    }
    //모음1개일 때
    for i in 0..<count[0].count {
        var word = [count[0][i]]
        for j in 0..<count[1].count {
            var jaWord = [[String]]()
            
        }
        
    }
}

solution()
func factorial_for(n:Int) -> Int {
    var result = 1
    for i in 0 ..< n { // 범위를 굳이 0 부터 한 이유는 0! = 1 이기 때문입니다.
        result = result * (i+1)
    }
    print(result, "fatorial of \(n)")
    return result
}

func combination(totalCount: Int, selectCount: Int) -> Int {
    var answer = 1
    var mul = 1
    for i in stride(from: totalCount, through: totalCount - selectCount, by: -1) {
        mul *= i
    }
    answer = mul / factorial_for(n: selectCount)
    print("combination \(totalCount)C\(selectCount) ==> \(answer)")
    return answer
}

