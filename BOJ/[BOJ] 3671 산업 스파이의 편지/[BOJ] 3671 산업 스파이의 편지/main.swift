import Foundation

func solution () {
    var finalAnswer: [Int] = [Int]()
    var testCase = Int(readLine()!)!
    
    for i in 0..<testCase {
        var n = Array(readLine()!).map { Int(String($0))! }
        var count = 0
        var number = n.reduce("") { String($0) + String($1) }
        if Int(number)! == 2 || Int(number)! == 3 { count += 1 }
        else {
            var numberArr: [Int] = [Int]()
            var visited = Array(repeating: false, count: n.count)
          
            var indexCount = 1
            var checkDuplicate: Set<Int> = Set<Int>()
            func backtracking(index: Int) {
                if index == indexCount {

                    var number = numberArr.reduce("") { String($0) + String($1) }
              
                    if !checkDuplicate.contains(Int(number)!) {
                        if Int(number)! > 1 {
                            if primeCheck(Int(number)!) {
                                count += 1
                       
                            }
                        }
                        checkDuplicate.insert(Int(number)!)
                    }
                    return
                } else {
                    for i in 0..<n.count {
                        if visited[i] == false {
                            numberArr[index] = n[i]
                            visited[i] = true
                            backtracking(index: index+1)
                            //return 부르면 바로 여기로옴
                            visited[i] = false
                        }
                    }
                    
                }
                
            }
            for i in 0..<n.count {
                numberArr = Array(repeating: 0, count: i+1)
                backtracking(index: 0)
                indexCount += 1
            }
        }
        finalAnswer.append(count)
    }
    for i in finalAnswer {
        print(i)
    }
}
func primeCheck(_ num: Int) -> Bool {
    var number = sqrt(Double(num))
  
    var answer: Bool = true
    
    if num == 2 || num == 3 { return true }
    if Int(number) >= 2 {
        for i in 2...Int(number) {
            if num % i == 0 {
                answer = false
                break
            }
        }
        return answer
    }
    return false
}

solution()
