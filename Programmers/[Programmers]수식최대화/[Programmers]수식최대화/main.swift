import Foundation

func solution(_ expression:String) -> Int64 {
    var answer: [Int] = [Int]()
    let operands: [[String]] = [
        ["*","-", "+"], ["*","+", "-"], ["+","*", "-"], ["+","-", "*"], ["-","+", "*"], ["-","*", "+"]
    ]
    let exArray = Array(expression)
    var resultExArray: [String] = [String]()
    var checking: String = ""
    for i in 0..<exArray.count {
        if !operands[0].contains(String(exArray[i])) {
            checking.append(exArray[i])
        } else{
            resultExArray.append(checking)
            checking = ""
            resultExArray.append(String(exArray[i]))
        }
        if i == exArray.count - 1 {
            resultExArray.append(checking)
        }
    }
    
    for cnt in 0..<6 {
        var resultexArray = resultExArray
        for i in 0..<3 {
            
            while resultexArray.contains(operands[cnt][i]) {
                guard let index = resultexArray.firstIndex(of: operands[cnt][i]) else { continue }
                var calculate: Int?
                if operands[cnt][i] == "*" {
                    calculate = Int(resultexArray[index - 1])! * Int(resultexArray[index + 1])!
                }
                else if operands[cnt][i] == "+" {
                    calculate = Int(resultexArray[index - 1])! + Int(resultexArray[index + 1])!
                }
                else if operands[cnt][i] == "-" {
                    calculate = Int(resultexArray[index - 1])! - Int(resultexArray[index + 1])!
                }
                resultexArray.remove(at: index - 1)
                resultexArray.remove(at: index - 1)
                resultexArray[index - 1] = String(calculate!)
            }
 
        }
        
        answer.append(abs(Int(resultexArray[0])!))
        
    }
    return Int64(answer.max()!)
}
