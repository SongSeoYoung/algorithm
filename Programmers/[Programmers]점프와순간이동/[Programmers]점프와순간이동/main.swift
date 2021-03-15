import Foundation

func solution(_ n:Int) -> Int {
    var number = n
    var ans:Int = 0
    while number != 0 {
//        print("------")
//        print(number)
//        print(ans)
        if number % 2 == 0 {
            number = number / 2
        }
        else {
            number -= 1
            ans += 1
        }
    }
    return ans
}

print(solution(5000))
