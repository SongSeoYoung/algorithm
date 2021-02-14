import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageArr: [Int] = stages
    stageArr.sort()     //[1,2,2,3,3,4,6]
    var people: Int = stageArr.count        //총 인원 8
    var result: [[Float]] = [[Float]]()
    for i in 1...N {
        var failN: Int = 0
        for f in stageArr {
            if f <= i {
                failN += 1
            } else{
                break
            }
        }
        result.append([Float(i), Float(Float(failN) / Float(people))])
        people -= failN
        for _ in 0..<failN {
            stageArr.remove(at: 0)
        }
    }
//    print(result)
    var answer1 = result.sorted(by: { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] > $1[1]})
    var answer: [Int] = [Int]()
    for i in 0..<answer1.count {
        let str = String(answer1[i][0]).split(separator: ".")
        answer.append(Int(str[0])!)
    }
    return answer
}

print(solution(4, [4,4,4,4,4]))
