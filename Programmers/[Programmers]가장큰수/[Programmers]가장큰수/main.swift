import Foundation

//MARK: - 인테넷에서 찾은 코드
func solution(_ numbers:[Int]) -> String {
    let result = numbers.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    print(result)
    if result[0] == 0 {
        return "0"
    }
    return result.reduce(""){ $0 + "\($1)"}
}

solution([53, 9, 340, 322, 31])

//MARK: -  내가 푼 코드.. 넘 더럽다

//}
//func sortCustom(_ n1: String, _ n2: String) -> Bool {
//
//    var n1Arr:[Character]?
//    var n2Arr:[Character]?
//    if n1.count < n2.count {
//        n1Arr = Array(n1)
//        n2Arr = Array(n2)
//    } else{
//        n1Arr = Array(n2)
//        n2Arr = Array(n1)
//    }
//    if n1Arr![0] != n2Arr![0] {
//        return n1 > n2
//    }
//    else{
//        if n1.count == n2.count {
//            return n1 > n2
//        }
//        else{
//            for i in 0..<n2Arr!.count {
//                if i >= n1Arr!.count {
//                    if n1Arr![n1Arr!.count - 1] < n2Arr![i] {
////                        print("\(n1), \(n2) 비교하는데..1")
//                        if n2Arr![n2Arr!.count - 1] < n1Arr![0] {
//                            return n1 < n2
//                        }else{
//                            return n1 > n2
//                        }
//
//                    }else if n1Arr![n1Arr!.count - 1] > n2Arr![i] {
////                        print("\(n1), \(n2) 비교하는데..2")
//                        return n1 < n2
//                    }
//                }else {
//                    if n1Arr![i] < n2Arr![i] {
////                        print("\(n1), \(n2) 비교하는데..3")
//                        if n2Arr![n2Arr!.count - 1] < n1Arr![0] {
//                            return n1 < n2
//                        }else{
//                            return n1 > n2
//                        }
//                    }else if n1Arr![i] > n2Arr![i] {
////                        print("\(n1), \(n2) 비교하는데..4")
//                        return n1 < n2
//                    }
//                }
//            }
//        }
//    }
//    return false
//}
//print(solution([40, 403]))
