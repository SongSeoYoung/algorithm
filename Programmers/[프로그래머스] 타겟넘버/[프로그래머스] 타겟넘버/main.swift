import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var table = Array(repeating: Array(repeating: [], count: 2), count: numbers.count)
    for i in 0..<numbers.count {
        if i == 0 {
            table[0][0] = [numbers[0]]
            table[0][1] = [numbers[0] * -1]
        }
        else {
            var list1 = [Int]()
            var list2 = [Int]()
            for j in 0..<table[i-1][0].count{
                list1.append(table[i-1][0][j] as! Int + numbers[i])
                list1.append(table[i-1][1][j] as! Int + numbers[i])
                list2.append(table[i-1][1][j] as! Int + numbers[i] * -1 )
                list2.append(table[i-1][0][j] as! Int + numbers[i] * -1 )
            }
            table[i][0] = list1
            table[i][1] = list2
        }
    }
    var count = 0
    for i in 0..<table[numbers.count - 1][0].count {
        if table[numbers.count - 1][0][i] as! Int == target { count += 1 }
        if table[numbers.count - 1][1][i] as! Int == target { count += 1 }
    }
    return count
}
print(solution([1,1,1,1,1], 3))
