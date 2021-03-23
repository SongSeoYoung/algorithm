import Foundation
func solution() -> String {
    let s = Array(readLine()!)
    var letter = [String]()
    var number = [Int]()
    for i in 0..<s.count {
        if s[i].isLetter {
            letter.append(String(s[i]))
        }
        else if s[i].isNumber {
            number.append(Int(String(s[i]))!)
        }
    }
    var result = ""
    letter.sort()
    result = letter.reduce(result){ $0 + $1 }
    result += "\(number.reduce(0){ $0 + $1 })"
    return result
}
print(solution())
