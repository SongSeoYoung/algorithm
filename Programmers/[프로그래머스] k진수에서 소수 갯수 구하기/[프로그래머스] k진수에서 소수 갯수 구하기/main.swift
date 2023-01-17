import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var number = n
    var nArray: [Int] = []
    while (number != 0) {
        nArray.append(number % k)
        number = number / k
    }
    let result = nArray.reversed().map{String($0)}.reduce("", +)
    
    let numberArray = result.split(separator: "0").compactMap { Int($0) }
    var count = 0
    numberArray.forEach { number in
        if primeCheck(number) {
            count += 1
        }
    }
    return count
}

func primeCheck(_ num: Int) -> Bool {
    var number = sqrt(Double(num)) // sqrt 제곱근 계산하는 것.
  
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

print(solution(437674, 3))

