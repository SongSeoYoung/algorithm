import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var computedL1 = l1
        var reversedLs1: [Int] = []
        
        while computedL1?.val != nil {
            reversedLs1.append(computedL1!.val)
            computedL1 = computedL1?.next
        }
        
        
        var computedL2 = l2
        var reversedLs2: [Int] = []
        while computedL2?.val != nil {
            reversedLs2.append(computedL2!.val)
            computedL2 = computedL2?.next
        }
        
        var result: [Int] = []
        if reversedLs1.count >= reversedLs2.count {
            reversedLs1.enumerated().forEach { index, r1 in
                var r2Value: Int = 0
                if reversedLs2.count - 1 >= index {
                    r2Value = reversedLs2[index]
                }
                result.append(r1 + r2Value)
            }
        } else if reversedLs1.count < reversedLs2.count {
            reversedLs2.enumerated().forEach { index, r1 in
                var r2Value: Int = 0
                if reversedLs1.count - 1 >= index {
                    r2Value = reversedLs1[index]
                }
                result.append(r1 + r2Value)
            }
        }
        var answer: ListNode?
        var olim: Int = 0
        var 현재answer: ListNode?
        result.enumerated().forEach { index, _result in
                var next: ListNode?
                // 마지막잉ㄴ 경우
                if index > result.count - 1 {
                    answer?.next = next
                }
                // 마지막이 아닌 경우
                else {
                    var 현재 = _result + olim
                    var current: Int = 0
                    if 현재 >= 10 {
                        current = 현재 % 10
                        olim = (현재 / 10)
                    } else {
                        olim = 0
                        current = 현재
                    }
                    if answer == nil {
                        answer = ListNode(current)
                        현재answer = answer
                    } else {
                        let k = ListNode(current)
                        현재answer?.next = k
                        현재answer = k
                    }
                }
        }
        if olim != 0 {
            현재answer?.next = .init(olim)
        }
        return answer
    }
}

/*
 Input: l1 = [2,4,3], l2 = [5, 6,4]

 Output: [7,0,8]
 Explanation: 342 + 46 = 388.
 */

let l1 = ListNode(1, nil)
let l2 = ListNode(9, nil)

print(Solution().addTwoNumbers(l1, l2))
