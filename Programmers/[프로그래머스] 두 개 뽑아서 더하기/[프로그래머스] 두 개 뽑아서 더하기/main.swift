import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var answer = Set<Int>()
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            answer.insert(numbers[i]+numbers[j])
        }
    }
    let result = answer.sorted()
    return result
}
print(solution([2,1,3,4,1]))
