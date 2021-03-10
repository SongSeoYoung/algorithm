import Foundation

 // MARK: - 나의 풀이
/*
 풀이시간 5분소요
 가장 작은값이 앞으로 오도록 입력받으면서 정렬 한 후에
 전체를 다시 돌면서 최소값 중 최대값을 찾는 방식을 선택
 */
func solution(n: Int, m: Int) -> Int {
    var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
    for i in 0..<n {
        arr[i] = Array(readLine()!.components(separatedBy: " ")).map{ Int(String($0))! }
        arr[i].sort()
    }
    var minOfMax: Int = arr[0][0]
    for i in 1..<n {
        if minOfMax < arr[i][0] {
            minOfMax = arr[i][0]
        }
    }
    return minOfMax
}

print(solution(n: 2, m: 4))

 // MARK: - 교재풀이

/*
 나랑 비슷한 알고리즘이지만, 입력받음과 동시에 최소값중 최대값을 찾도록.. 더 간결하고 빠르다
 */
func solution2(n: Int, m: Int) -> Int {
    var arr = Array(repeating: Array(repeating: 0, count: m), count: n)
    var result = 0
    for i in 0..<n {
        arr[i] = Array(readLine()!.components(separatedBy: " ")).map{ Int(String($0))! }
        arr[i].sort()
        result = max(result, arr[i][0])
    }
    return result
}

print(solution2(n: 2, m: 4))
