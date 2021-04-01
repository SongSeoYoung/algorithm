//import Foundation
//
//func solution(_ p:String) -> String {
//    let pArr = Array(p)
//    var rightOpen = 0
//    var leftOpen = 0
//    var u = [Character]()
//    var v = [Character]()
//
//
//    func checkOK(what: [Character]) -> Bool{
//        var whatString = what
//        var whatStack = [Character]()
//        while !whatString.isEmpty {
//            let char = whatString.remove(at: 0)
//            if char == "(" {
//                whatStack.append(char)
//            }
//            else{
//                if whatStack.last == "(" {
//                    whatStack.popLast()
//                }
//                else{
//                    whatStack.append(char)
//                }
//            }
//        }
//        if whatStack.isEmpty {
//            return true
//        }
//        return false
//
//    }
//
//    func divideUV(pArray: [Character]) {
//        //u와 v로 나누기
//        var count = 0
//        for i in pArray {
//            if rightOpen == 0 && leftOpen == 0 {
//                if i == "(" {
//                    rightOpen += 1
//                }
//                else if i == ")" {
//                    leftOpen += 1
//                }
//                u.append(i)
//                count += 1
//            }
//
//
//            else{
//                if !(rightOpen == leftOpen){
//                    if i == "(" {
//                        rightOpen += 1
//                    }
//                    else if i == ")" {
//                        leftOpen += 1
//                    }
//                    u.append(i)
//                    count += 1
//                }
//            }
//
//        }
//        print(count)
//        for j in count..<pArr.count{
//            v.append(pArr[j])
//        }
//    }
//
//
//    //u가 올바른 문자열이면
//    divideUV(pArray: pArr)
//    print(u, "u")
//    print(v, "v")
//
//    if checkOK(what: u) {
//        //v에 대해 실행
//        print("u 는 완벽 v가 안벽해질 대 까지 v를 돈다.")
//        while checkOK(what: v) == false {
//            print(v)
//            print(u)
//            print("v 완벽하지않아요..")
//            divideUV(pArray: v)
//        }
//    }
//    else{
//        divideUV(pArray: v)
//
//        var stringResult = v.reduce("("){ String($0) + String($1) }
//        stringResult += ")"
//        u.removeFirst()
//        u.removeLast()
//        stringResult += u.reduce("") { String($0) + String($1) }
//        print(stringResult)
//    }
//
//
//    return ""
//}
//
//solution("()))((()")


import Foundation

func solution(_ p:String) -> String {
    func checkOK(what: [Character]) -> Bool{
        var whatString = what
        var whatStack = [Character]()
        while !whatString.isEmpty {
            let char = whatString.remove(at: 0)
            if char == "(" {
                whatStack.append(char)
            }
            else{
                if whatStack.last == "(" {
                    whatStack.popLast()
                }
                else{
                    whatStack.append(char)
                }
            }
        }
        if whatStack.isEmpty {
            return true
        }
        return false
        
    }
    let pArr = Array(p)
    if !checkOK(what: pArr) {
        
    }
        return ""
}
