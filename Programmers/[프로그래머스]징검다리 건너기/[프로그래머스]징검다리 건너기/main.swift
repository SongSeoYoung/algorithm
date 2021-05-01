import Foundation

func solution(_ stones:[Int], _ k:Int) -> Int {
    let people = stones.max()!
    var stones = stones
    
    func binarySearch(start: Int, end: Int) -> Int {
        var answer = 1
        var start = start
        var end = end
        if stones.count == 1 {
            return stones.min()!
        }
        while start <= end {
            var index = [Int]()
            let mid = (start + end ) / 2

            for i in 0..<stones.count {
                if stones[i] <= mid {
                    stones[i] = 0
                    index.append(i)
                }
            }
            //연속되는 갯수 찾기
            var count = 1
            for i in 0..<index.count - 1{
                if index[i] + 1 == index[i+1] {
               
                    count += 1
                }
            }
     
            //연속되는 갯수가 조건보다 많은지 적은지에따라 이분법 실행
            if count < k{
                start = mid + 1
                answer = mid
            } else if count > k{
                end = mid - 1
            } else if count == k{
                answer = mid
                break
            }
        }
        return answer
    }
    return binarySearch(start: 1, end: people)
}

print(solution([7], 3))
