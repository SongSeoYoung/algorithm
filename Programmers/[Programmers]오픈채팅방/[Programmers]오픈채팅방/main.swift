//import Foundation
//
//func solution(_ record:[String]) -> [String] {
//    var enter: [[String]] = [[String]]()
//    var leave: [[String]] = [[String]]()
//    var order: [Int] = [Int]()
//    for i in 0..<record.count {
//        let currentCheck: String = record[i]
//        let currentCheckArray = currentCheck.split(separator: " ")
//        switch currentCheckArray[0] {
//        case "Enter":
//            order.append(0)
//            //이미 들어왔다가 나간 값이 다시 들어오는 경우에 대한 체크
//            for index in 0..<leave.count {
//
//                //만약 들어갔다 나간 아이디었다면
//                if leave[index][0].contains(String(currentCheckArray[1])) {
//                    print("들어왔다가 나간 아이디가 다시 들어온경우라면 -> 전체 닉네임 변경")
//                    //leave 에대한 닉네임 변경
//                    leave[index][1] = String(currentCheckArray[2])
//
//                    //enter 에 대한 닉네임 변경
//                    for enterIndex in 0..<enter.count {
//                        if enter[enterIndex][0] == String(currentCheckArray[1]) {
//                            enter[enterIndex][1] = String(currentCheckArray[2])
//                        }
//                    }
//                }
//                //처음들어온 아이디
//                else{
//                    print("처음 들어온 아이디 처리")
//                    enter.append( [ String(currentCheckArray[1]), String(currentCheckArray[2]) ])
//                }
//            }
//            print("처음 들어온 아이디 처리")
//            enter.append( [ String(currentCheckArray[1]), String(currentCheckArray[2]) ])
//
//        case "Leave":
//            order.append(1)
//            print("leave")
//            for i in 0..<enter.count {
//                if enter[i][0] == String(currentCheckArray[1]) {
//                    leave.append( [ String(currentCheckArray[1]), enter[i][1]])
//                }
//            }
//
//        case "Change":
//
//            //enter 에서 값 바꾸기
//            for enterIndex in 0..<enter.count {
//                if enter[enterIndex][0] == String(currentCheckArray[1]) {
//                    print("change -> enter 에서 이름 바꾸기")
//                    enter[enterIndex][1] = String(currentCheckArray[2])
//                }
//            }
//
//            //leave 에서 값 바꾸기
//            for leaveIndex in 0..<leave.count {
//                if leave[leaveIndex][0] == String(currentCheckArray[1]) {
//                    print("change -> leave 에서 이름바꾸기")
//                    leave[leaveIndex][1] = String(currentCheckArray[2])
//                }
//            }
//        default:
//            print("deafault")
//        }
//
//    }
//
//    var result: [String] = [String]()
//    for _ in 0..<order.count {
//        let popValue: Int = order.remove(at: 0)
//        switch popValue {
//        case 0:
//            result.append("\(enter[0][1])님이 들어왔습니다.")
//            enter.remove(at: 0)
//        case 1:
//            result.append("\(leave[0][1])님이 나갔습니다.")
//            leave.remove(at: 0)
//        default:
//            print("default")
//        }
//    }
//    return result
//}
//
//print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]))


import Foundation

func solution(_ record:[String]) -> [String] {
    var order: [Int] = [Int]()
    var leave: [String] = [String]()
    var dic: [String: String] = [String: String]()
    var key: [String] = [String]()
    for i in 0..<record.count {
        let currentCheck: String = record[i]
        let currentCheckArray = currentCheck.split(separator: " ")
        switch currentCheckArray[0] {
        case "Enter":
            order.append(0)
            key.append(String(currentCheckArray[1]))
            dic[String(currentCheckArray[1])] = String(currentCheckArray[2])
        case "Leave":
            order.append(1)
            leave.append(String(currentCheckArray[1]))
//            dic.removeValue(forKey: String(currentCheckArray[1]))
        case "Change":
            dic.updateValue(String(currentCheckArray[2]), forKey: String(currentCheckArray[1]))
        default:
            print("default")
        }
    }
    var result: [String] = [String]()
    for i in 0..<order.count {
        if order[i] == 0 {
            result.append("\(dic[key[0]]!)님이 들어왔습니다.")
            key.remove(at: 0)
        }
        else{
            result.append("\(dic[leave[0]]!)님이 나갔습니다.")
        }
    }
//    print(key, "key")
    print(dic, "dic")
//    print(leave, "leave")
//    print(order, "order")
    return result
}
print(solution(["Enter uid1234 1234", "Enter uid4567 4567","Enter uid122 122","Enter uid13 13","Enter uid121 121","Enter uid1212 1212","Enter uid2222 2222","Enter uid21 21","Enter uid23 23", "Leave uid13", "Change uid23 li"]))
