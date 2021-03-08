import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var dList = d.sorted()
    print(dList)
    var budget = budget
    var count = 0
    for i in 0..<dList.count {
        if budget >= 0 {
            budget -= dList[i]
            if budget < 0 {
                return count
            }else {
                count += 1
            }
        }else {
            break
        }
    }
    return count
    
}

print(solution([1,3,2,5,4], 9))
