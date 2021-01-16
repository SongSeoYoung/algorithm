import Foundation

let i: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
var arr: [[Int]] = Array(repeating: [], count: i[0]+1)
var inDegree: [Int] = Array(repeating: 0, count: i[0]+1)
for _ in 0..<i[1] {
    let compareTo: [Int] = readLine()!.split(separator: " ").map{Int($0)!}
    arr[compareTo[0]].append(compareTo[1])
    inDegree[compareTo[1]] = inDegree[compareTo[1]] + 1
}

var queue: [Int] = []
for i in 1..<inDegree.count {
    if inDegree[i] == 0 {
        queue.append(i)
    }
}
//print(queue)

var result:[Int] = []
while !queue.isEmpty {
    let value: Int = queue.remove(at: 0)
    result.append(value)
//    print(result)
    for i in arr[value] {
        inDegree[i] = inDegree[i] - 1
        if inDegree[i] == 0 {
            queue.append(i)
        }
    }
}
for i in 0..<result.count{
    print(result[i], terminator:" ")
}
