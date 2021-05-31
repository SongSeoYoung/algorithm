import Foundation

func solution() {
    let testCase = Int(String(readLine()!))!
    for i in 0..<testCase {
        let command = Array(readLine()!)
        let arrayCount = Int(String(readLine()!))!
        var arr = readLine()!.components(separatedBy: ["[", "]", ","]).filter { a in
            if a != "" {
                return true
            }
            else { return false }
        }.map { Int($0)! }
        if arr.isEmpty { print("error") }
        else {
            var left = 0
            var right = 0
            var Rcount = 0
            for c in 0..<command.count {
                if command[c] == "R" {
                    Rcount += 1
                }
                if command[c] == "D" {
                    if Rcount % 2 != 0 {
                        right += 1
                    }
                    else { left += 1 }
                }
            }
            if left + right > arr.count { print("error")}
            else {
                arr = Array(arr[left..<(arr.count - right)])
                if Rcount % 2 != 0 { arr = arr.reversed() }
                var answer = "["
                for i in 0..<arr.count {
                    if i == arr.count - 1 {
                        answer = "\(answer)\(arr[i])]"
                    }else {
                        answer = "\(answer)\(arr[i]),"
                    }
                }
                print(answer)
            }
        }
    }
}

solution()
