import Foundation

struct indexMax {
    var rate: Double
    var index: Int
}
func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    let totalStage = N
    var stages = stages
    stages.sort()
    var people = stages.count
    var failRate = Array(repeating: 0.0, count: totalStage)
    for j in 0..<totalStage {
        for l in 0..<stages.count {
            if j + 1 == stages[l] {
                failRate[j] += 1
            }
        }
        let number = failRate[j]
        failRate[j] = failRate[j] / Double(people)
        people -= Int(number)
    }

    var indexInfo: [indexMax] = [indexMax]()
    for i in 0..<failRate.count {
        indexInfo.append(indexMax(rate: failRate[i], index: i + 1))
    }
    indexInfo.sort { (rate1, rate2) -> Bool in
        return rate1.rate > rate2.rate
    }
    var result = [Int]()
    for i in 0..<indexInfo.count {
        result.append(indexInfo[i].index)
    }
    return result
}

 print(solution(5, [2, 1, 2, 6, 2, 4, 3, 3]))
