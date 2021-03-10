import Foundation

// MARK: - 나의 풀이
/*
 풀이 시간 : 3분
 요구하는대로 구현하면된다. 나눗셈을 하는게 제일 횟수를 줄일 수 있으니 나눗셈을 최대한 할 수 있도록 -1 을 해주면됨.
 */
func solution(n: Int, k: Int) -> Int {
    var count = 0
    var n = n
    while n != 1 {
        print(n)
        if n % k != 0 {
            count += 1
            n -= 1
        }else{
            count += 1
            n /= k
        }
    }
    return count
}

print(solution(n: 25, k: 5))
