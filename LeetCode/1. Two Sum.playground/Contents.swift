import UIKit

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var answer: [Int] = []
        nums.enumerated().forEach { index, num in
            if let secIndex: Int = nums.firstIndex(of: target - num),
             secIndex != index {
                answer = [index, secIndex]
            }
        }
        return answer
    }
}
