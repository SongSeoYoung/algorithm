import Foundation

// MARK: - 나의 첫 풀이

/*
 7분 소요
 
 어차피 배열의 0,1번째 인덱스번호만 사용할 것이니까 ..
 for문을 m의 수만큼 돌리기 위해 forEach구문을 사용했다. (어차피 해당 숫자가 필요하지 않아서 _ in 으로 클로저처리)
 최대반복수를 체크하기위해서 stack에다가 어떤 수를 더해줬는지 추가해줬다.
 그리고 계속해서 stack의 갯수를 파악했다. 스택 속의 갯수가 반복가능한 횟수를 넘으면 스택을 초기화하고 1번째 인덱스를 최종적으로 더하도록하였다.
 */

func solution(n: Int, m: Int, k: Int) -> Int{
    var arr = Array(readLine()!).map{ Int(String($0))! }
    arr = arr.sorted(by: >)
    var result = 0
    var stack = [Int]()
    (0..<m).forEach {_ in
        stack.append(arr[0])
        if stack.count > k {
            stack = []
            result += arr[1]
        }else{
            result += arr[0]
        }
    }
    return result
}
print(solution(n: 5, m: 8, k: 3))



// MARK: - 교재풀이
/*
 무한반복으로 돌린 후 m의 수를 줄여나가는 방식으로함.
 k가 될 때 까지 first를 반복으로 더해주고 k번 반복하면 second를 한 번 더하는 식으로 ..
 이를 반복해서 구현한 것 같다.
 */
func solution2(n: Int, m: Int, k: Int) -> Int{
    var m = m
    var arr = Array(readLine()!).map{ Int(String($0))! }
    arr = arr.sorted(by: >)
    let firstValue = arr[0]
    let secondValue = arr[1]
    var result = 0
    while true {
        for _ in 0..<k {
            if m == 0 {
                break
            }
            result += firstValue
            m -= 1
        }
        if m == 0 {
            break
        }
        result += secondValue
        m -= 1
    }
    return result
}
print(solution2(n: 5, m: 8, k: 3))
