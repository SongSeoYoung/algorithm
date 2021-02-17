import Foundation

let number = Int(readLine()!)!
var arr: [[Character]] = [[Character]]()
for _ in 0..<number {
    arr.append(Array(readLine()!))
}

var result: Int = 0
for a in arr {
    var set = Set<Character>()
    for i in 0..<a.count {
        let setC = set.count
        set.insert(a[i])
        if setC == set.count && ( i != 0 && a[i] != a[i-1]) {
//            print("그룹단어아님")
            break
        }
        if i == a.count - 1 {
//            print("마지막까지 돌았는데 이건 그룹단어예용!!")
            result += 1
        }
    }
}
print(result)
