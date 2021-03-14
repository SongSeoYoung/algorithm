import Foundation

func solution(_ s:String) -> Int{
    let arrayS = Array(s)
    var stack = [Character]()
    for i in 0..<arrayS.count {
        if !stack.isEmpty {
            if stack.last == arrayS[i] {
                stack.popLast()
            } else{
                stack.append(arrayS[i])
            }
        }else{
            stack.append(arrayS[i])
        }
    }
    return stack.isEmpty ? 1 : 0
}

print(solution("cdcd"))
