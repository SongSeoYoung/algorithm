import Foundation

func solution () {
    var testCase = Int(readLine()!)!
    
    for i in 0..<testCase {
        var n = Array(readLine()!).map { Int(String($0))! }
        print(n)
        var numberArr: [Int] = [Int]()
        var visited = Array(repeating: false, count: n.count)
        var count = 0
        var indexCount = 1
        func backtracking(index: Int) {
            if index == indexCount {
                print(numberArr)
                var number = numberArr.reduce("") { String($0) + String($1) }
                print(Int(number)!)
                if Int(number)! > 1 {
                    if primeCheck(Int(number)!) {
                        count += 1
                        print(Int(number)!, "is prime")
                    }
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
            print("new backtracking")
            numberArr = Array(repeating: 0, count: i+1)
            backtracking(index: 0)
            indexCount += 1
        }
        print(count)
    }
    
}
func primeCheck(_ num: Int) -> Bool {
    var number = sqrt(Double(num))
  
    var answer: Bool = true
    print(num, "prime check", number)
    if Int(number) > 2 {
        for i in 2..<Int(number) {
            if num % i == 0 {
                answer = false
                break
            }
        }
        return answer
    } else if Int(number) == 2 { return true }
    else { return false }
}

solution()
