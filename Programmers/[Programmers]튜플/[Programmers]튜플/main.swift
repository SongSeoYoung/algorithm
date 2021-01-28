import Foundation

func solution(_ s:String) -> [Int] {
    let inputValue: [String] = s.components(separatedBy: ["{", "}"])
    var tuple: [String] = [String]()
    for i in 0..<inputValue.count {
        if inputValue[i] != "" && inputValue[i] != "," {
            tuple.append(inputValue[i])
        }
    }
    tuple.sort(by: sortLength(_:_:))
    var result: [Int] = [Int]()
    result.append(Int(tuple[0])!)
    for i in 1..<tuple.count {
        let check = tuple[i].split(separator: ",")
        for l in check {
            if !result.contains(Int(String(l))!) {
                result.append(Int(String(l))!)
            }
        }
    }
    return result
}

func sortLength(_ s1: String, _ s2: String) -> Bool {
    return s1.count < s2.count
}
