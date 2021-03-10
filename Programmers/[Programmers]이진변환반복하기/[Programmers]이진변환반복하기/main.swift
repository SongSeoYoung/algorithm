import Foundation

var zeroCount = 0
var count = 0
func solution(_ s:String) -> [Int] {
    var string = s
    while string != "1" {
        string = make1(str: string)
    }
    
    return [count, zeroCount]
}
func make1(str: String) -> String {
    count += 1      //반복횟수
    let arr = Array(str).filter{ $0 != "0"}
    print(arr)
    zeroCount += str.count - arr.count        //제거된 0의 갯수 추가해주기
    let radix2 = String(arr.count, radix: 2)
    print(radix2)
    return radix2
}
print(solution("110010101001"))
