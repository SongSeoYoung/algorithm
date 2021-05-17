
import Foundation

func solution(_ record:[String]) -> [String] {
    var answerStack = [[String]]()
    var dic: [String: String] = [String: String]()
    for i in 0..<record.count {
        let arr: [String] = record[i].split(separator: " ").map { String($0) }
        switch arr[0] {
        case "Enter":
            answerStack.append([arr[1]])
            //[uid1234: Muzi]
            dic.updateValue(arr[2], forKey: arr[1])
        case "Change":
            dic.updateValue(arr[2], forKey: arr[1])
        case "Leave":
            answerStack.append([arr[1], "l"])
        default:
            print("default")
        }
    }
    var result: [String] = [String]()
    for i in 0..<answerStack.count {
        if answerStack[i].count == 1 {
            result.append("\(dic[answerStack[i][0]]!)님이 들어왔습니다.")
        } else {
            result.append("\(dic[answerStack[i][0]]!)님이 나갔습니다.")
        }
        
    }
    return result
}

print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan", "Leave uid1234"]))


/*
 
과거 나의 풀이 -> 중요한 점은 O(n)을 넘어가면 시간초과가 뜬다.
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
    return result
}
*/
