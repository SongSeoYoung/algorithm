import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var numberA = a
    var numberB = b
    var answer = 0
    
    //항상 a<b이도록 만들기
    if numberA > numberB {
        let temp = numberA
        numberA = numberB
        numberB = temp
    }
    
    while true {
        print(numberA, numberB)
        print("count is", answer)
        answer += 1
        if checkNow(a: numberA, b: numberB) {
            break
        }else{
            numberA = makeNewNumber(numberA)
            numberB = makeNewNumber(numberB)
        }
    }
    return answer
}

func checkNow(a: Int, b: Int) -> Bool {
    if b%2 == 0 && (b - 1 == a && a + 1 == b) {
      return true
    } else {
        return false
    }
}
func makeNewNumber(_ number: Int) -> Int {
    var number = number
    if number % 2 != 0 {
        number += 1
        number /= 2
    }
    else {
        number /= 2
    }
    return number
}
print(solution(8, 7, 1))
