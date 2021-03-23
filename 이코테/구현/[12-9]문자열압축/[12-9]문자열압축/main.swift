///*
// 완전탐색을 써야될 것 같은 기분..
// 시간이 가능하려나 모르겠다
// */
//
//import Foundation
//
//func solution(_ s:String) -> Int {
//    var minCount = 0
//    let arrS = Array(s)
//    //완전 탐색을 위한 길이 설정 반복문
//    for i in 1...arrS.count/2 {
//
//            var newArr = [String]()
//            for j in stride(from: 0, through: arrS.count - i, by: i) {
//                let char = arrS[j..<j+i].map{String($0)}.reduce(""){ $0 + $1 }
//                newArr.append(char)
//            }
//            print(i, "의 단위로 짤랐을 때", newArr)
//            var copyNewArr = newArr
//            var removeCount = 0
//            var nowRemove = 1
//            var number = [Int]()
//            for l in 1..<newArr.count {
//                if newArr[l] == newArr[l-1] {
//                    copyNewArr.remove(at: l - removeCount)
//                    removeCount += 1
//                    nowRemove += 1
//                    if l == newArr.count - 1 {
//                        number.append(nowRemove)
//                    }
//                }else{
//                    if nowRemove != 1 {
//                        number.append(nowRemove)
//                        nowRemove = 1
//                    }
//                }
//            }
//
//            print(i, "의 단위로 짤랐을 때 겹치는거 압축", copyNewArr, "숫자", number)
//            let newString = copyNewArr.reduce(""){ $0 + $1 }
//            print(newString)
//            if i == 1 {
//                minCount = newString.count + number.count
//            }else{
//                minCount = min(minCount, newString.count + number.count)
//            }
//            print("현재 MinCount", minCount)
//        }
//
//    return minCount
//}
//
//print(solution("abcabcdede"))
// 2a2ba3c.count = 7


//import Foundation
//
//func solution(_ s:String) -> Int {
//    var str = Array(s)
//    var answer = s.count
//    for step in 1..<s.count / 2 {
//        var compressed = ""
//        var prev = str[0..<step]
//        var count = 1
//        for j in stride(from: step, through: s.count - 1, by: step) {
//            if prev == str[j..<j + step] {
//                count += 1
//            }
//            else{
//                count >= 2 ? (compressed += String(count)) : (compressed += prev)
//                prev = str[j..<j+step]
//                count = 1
//            }
//        }
//        count >= 2 ? (compressed += String(count)) : (compressed += prev)
//        answer = min(answer, compressed.count)
//    }
//    return answer
//}
//
//print(solution("abcabcdede"))


//// 10개가 반복되는 경우 10af이런식으로 쓰이는데 이를 10은 2자리니까 1자리로 카운팅하도록.
//func dupLen(of dupCnt: Int) -> Int {
//        if dupCnt >= 100 {
//            return 3
//        }else if dupCnt >= 10 {
//            return 2
//        }
//    return 1
//}
//func solution(_ s: String) -> Int {
//    let arr = Array(s)
//    var maxLen = arr.count  //배열의 최대길이
//    var Ans = maxLen        //정답으로 반환할 변수
//    if maxLen <= 2 { return Ans }
//
//    for len in 1...maxLen / 2 {     //절반까지만 돌려도 됨. 왜냐하면 절반이상을 돌려봤자 절대로 중복이 나올 수 없다. aaa는 절반 2 이상 으로 쪼개면 aa, a로 나뉘는데 절대 같을 수 없기 때문
//        var prev = [String]()
//        var cnt = 0     //현재 문자 길이
//        var dup = 1     //중복 횟수
//        var addLen = 0      //총 길이를 표시한다. 20d123ad일 경우 5가되는 것.! dupLen을 통해서 변환해 계산
//        var str = ""        //n개 단위로 잘라낸 문자열을 만들어 체크
//        for char in arr {
//            str += "\(char)"        //len 길이의 문자열 만들기
//            cnt += 1        // 현재 문자열 길이 체크
//            if cnt == len {
//                if !prev.isEmpty && prev.last! == str {
//                    dup += 1
//                } else {
//                    if dup > 1 {
//                        addLen += dupLen(of: dup)
//                        dup = 1
//                    }
//                    prev.append(str)
//                }
//                cnt = 0
//                str = ""
//            }
//        }
//        let nowLen = prev.count * len + cnt + addLen + (dup > 1 ? dupLen(of: dup) : 0)
//        Ans = Ans > nowLen ? nowLen : Ans
//    }
//    return Ans
//}
import Foundation
 
func solution(_ s:String) -> Int {
    var answerarr = [Int]()
    var a = 0       //자르는 단위
    while a <= s.count/2 {      //자르는 단위 체크
        var x = 0
        var count = 1
        var pre = ""
        var answer = ""
        a += 1      //자르는 단위 증가
        while x <= s.count {
            let remainder = s.suffix(s.count-x)
            let prefix = remainder.prefix(a)
            if pre == prefix {
                count += 1
                x += a
                continue
            }
            if count > 1 {
                answer += "\(count)\(pre)"
            }
            answer += pre
            pre = String(prefix)
            count = 1
            x += a
        }
        answer += String(s.suffix(s.count-(x-a)))
        answerarr.append(answer.count)
    }
    return answerarr.min()!
}
