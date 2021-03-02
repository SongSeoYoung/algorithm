import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var queue: [Float] = [Float]()
    for i in 0..<progresses.count {
        queue.append(ceil(( Float(100 - progresses[i] )) / Float(speeds[i])))
    }
    print(queue)
    var result: [Int] = [Int]()
    while !queue.isEmpty {
//        print("---------------")
//        print(queue, "queue")
        let first = queue.remove(at: 0)
//        print(first, "first")
        var count = 1
        for i in 0..<queue.count {
            if queue[i] <= first {
                count += 1
            }else { break }
        }
//        print("돌면서 찾은 카운ㅌ\(count)")
        result.append(count)
        for _ in 0..<count - 1 {
            queue.remove(at: 0)
        }
//        print("지운 이후에 queue, \(queue)")
    }
    return result
}
print(solution([95,95, 2], [4,3,1]))
