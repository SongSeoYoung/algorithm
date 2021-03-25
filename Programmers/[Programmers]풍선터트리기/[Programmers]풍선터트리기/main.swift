import Foundation

func solution(_ a:[Int]) -> Int {
    var count = 0
    var min1 = [Int]()
    var min2 = [Int]()
    var currentMinN = Int.max       //현재 최솟값
    for i in 0..<a.count {
        if currentMinN > a[i] {
            currentMinN = a[i]
        }
        min1.append(currentMinN)
    }
    currentMinN = Int.max
    for i in stride(from: a.count - 1, through: 0, by: -1) {
        if currentMinN > a[i]{
            currentMinN = a[i]
        }
        min2.append(currentMinN)
    }
    for i in 0..<a.count {
        var arr = [min1[i], a[i], min2[a.count-1 - i]]
        arr.sort()
        if !(arr.firstIndex(of: a[i]) == 2) {
            count += 1
        }
    }
    /*
    for i in 0..<a.count {
        let target = a[i]
        let copyA = a
        if i >= 1 && i < copyA.count - 2{
            let min1 = copyA[0..<i].min()!
            let min2 = copyA[i+1..<copyA.count - 1].min()!
            var arr = [min1, min2, target]
            arr.sort()
            if !(arr.firstIndex(of: target) == 2) {
                count += 1
            }
        }
        else if i == copyA.count - 2 {
            let min1 = copyA[0..<i].min()!
            let min2 = copyA[copyA.count - 1]
            var arr = [min1, min2, target]
            arr.sort()
            if !(arr.firstIndex(of: target) == 2) {
                count += 1
            }
        }
        else{
            count += 1
        }
    }
 */
    return count
}

print(solution([-16,27,65,-2,58,-92,-71,-68,-61,-33]))
