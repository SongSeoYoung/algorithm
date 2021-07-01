import Foundation
func solution() {
    let n = Int(String(readLine()!))!
    
    var arr: [[String]] = [[String]]()
    var dic: [String: Int] = [String: Int]()
    
    for _ in 0..<n {
        arr.append(Array(readLine()!).map { String($0) })
    }
    var arrCount = arr.count
    arr.sort { a, b in
            return  a.count >= b.count
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

//solution()


func sol2() {
    var n = Int(String(readLine()!))!
    var arr: [[String]] = [[String]]()
    var dic: [String: Int] = [String: Int]()
    
    for _ in 0..<n {
        arr.append(Array(readLine()!).map { String($0) })
    }
    print(arr)
    for i in 0..<arr.count {
        for j in 0..<arr[i].count {
            
            var a = 1
            for i in 0..<arr[i].count - j - 1{
                a *= 10
            }
            
            if let originalValue = dic[arr[i][j]] {
                dic.updateValue(originalValue + a, forKey: arr[i][j])
            } else {
                dic.updateValue(a, forKey: arr[i][j])
            }
        }
    }
    print(dic)
    var arrNew: [Int] = [Int]()
    for i in dic.values {
        arrNew.append(i)
    }
    var initValue = 9
    var sum = 0
    arrNew.sort { a, b in
        return a > b
    }
    for i in arrNew {
        sum += i*initValue
        initValue -= 1
    }
    print(sum)
}

sol2()
