//MARK: - 내 풀이
func solution(_ dartResult:String) -> Int {
    let a: [String] = Array(dartResult).map{String($0)}
    let SDT: [String] = ["S","D","T"]
    let multi: [String] = ["*", "#"]
    var arr: [String] = [String]()
    var sum: String = ""
    for i in 0..<a.count {
        if SDT.contains(a[i]) || multi.contains(a[i]) {
            arr.append(a[i])
        } else if i != a.count - 1 && !(SDT.contains(a[i+1]) || multi.contains(a[i+1])) {
            sum += String(a[i])
        } else if i != a.count - 1 && (SDT.contains(a[i+1]) || multi.contains(a[i+1])){
            sum += String(a[i])
            arr.append(sum)
            sum = ""
        } else {
            arr.append(a[i])
        }
    }
    var stack: [Int] = [Int]()
    for i in 0..<arr.count {
        if SDT.contains(arr[i]) {
            let n: Int = stack.popLast()!
            switch arr[i] {
            case "S":
                stack.append(n)
            case "D":
                stack.append(n * n)
            case "T":
                stack.append(n * n * n)
            default:
                print("default")
            }
        }
        else if multi.contains(arr[i]){
            switch arr[i] {
            case "*":
                if stack.count >= 2{
                    let n1 = stack.popLast()!
                    let n2 = stack.popLast()!
                    stack.append(n2 * 2)
                    stack.append(n1 * 2)
                }else {
                    stack.append(stack.popLast()! * 2)
                }

            case "#":
                stack.append(stack.popLast()! * -1)
            default:
                print("default multi")
            }
        }
        else {
            stack.append(Int(String(arr[i]))!)
        }
    }
    var answer: Int = 0
    for i in 0..<stack.count {
        answer += stack[i]
    }
    return answer
}

print(solution("1D2S3T*"))

//MARK: - 다른 분 풀이
func solution(_ dartResult:String) -> Int {

        //문자 (aefg...)와 # * 로 나눔-> SDT, #, * 로 나뉜 배열 -> 숫자배열
        let numberList = dartResult.split(whereSeparator: {$0.isLetter || $0 == "#" || $0 == "*"})
        //숫자로 나눔 -> 문자들이 담김
        let letterList = dartResult.split(whereSeparator: {$0.isNumber})
    print(letterList)
    print(numberList)

        var totalScore = 0

        //i = number 과 letter의 인덱스번호
    //number = numberlist 항목
    //letter = letterList 항목
        for (i, (number, letter)) in zip(numberList, letterList).enumerated() {
            print(i, number, letter)
            var score = 0
            if let number = Int(number) {
                //SDT 연산처리
                score = letter.contains("D") ? number * number : letter.contains("T") ? number * number * number : number
            }
            
            //"*, #연산처리"
            if letter.contains("*") {
                score *= 2
            } else if letter.contains("#") {
                score = -score
            }
            //*는 이 전 2개의 값에 대해 해주니까..
            if i != 2 {
                if letterList[i + 1].contains("*") {
                    score *= 2
                }
            }

            totalScore += score

        }


        return totalScore
}
print(solution("1D20S3T*"))
