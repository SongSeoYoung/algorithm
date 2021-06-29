func solution() {
    let n = Int(String(readLine()!))!
    
    var arr: [[String]] = [[String]]()
    var dic: [String: Int] = [String: Int]()
    
    for _ in 0..<n {
        arr.append(Array(readLine()!).map { String($0) })
    }
    arr.sort { a, b in
        if a.count != b.count {
            return  a.count > b.count
        }
        else {
            var aCount = 0
            var bCount = 0
            for i in 0..<a.count {
                if a[i] == a[0] { aCount += 1 }
            }
            for i in 0..<b.count {
                if b[i] == b[0] { bCount += 1 }
            }
            return aCount > bCount
        }
    }
//    print(arr)
    var count = 9
    
    for j in 0..<arr[0].count {
        if dic[arr[0][j]] == nil {
            dic.updateValue(count, forKey: arr[0][j])
            count -= 1
        }
        for i in 1..<arr.count {
           
            if arr[0].count == arr[i].count {
                if dic[arr[i][j]] == nil {
                    dic.updateValue(count, forKey: arr[i][j])
                    count -= 1
                }
            }
            else if j - (arr[i].count-1) < 0 { continue }
            else {
                if dic[arr[i][j-(arr[i].count-1)]] == nil {
                    dic.updateValue(count, forKey: arr[i][j-(arr[i].count-1)])
                    count -= 1
                }
            }
        }
    }
//    print(dic)
    var answer = 0
    for i in 0..<arr.count {
        var total: [String] = [String]()
        for j in 0..<arr[i].count {
            total.append(String(dic[arr[i][j]]!))
        }
        answer += Int(total.reduce("") { $0 + $1 })!
    }
    print(answer)
}

solution()
