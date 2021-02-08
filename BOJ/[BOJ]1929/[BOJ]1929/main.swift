import Foundation

let info: [Int] = Array(readLine()!.split(separator: " ")).map{ Int(String($0))!}
let start: Int = info[0]
let end: Int = info[1]

func findDecimal(of number : Int) -> Bool {
    if number == 1 {
        return false
    }
    let sqrtNumber: Int = Int(sqrt(Double(number)))
    for i in 1...sqrtNumber{
        if i != 1 && number % i == 0 {
            return false
        }
    }
    return true
}
var answer: [Int] = [Int]()
for i in start...end {
    if findDecimal(of: i) {
        answer.append(i)
    }
}
//print(answer)
for a in answer {
    print(a)
}
