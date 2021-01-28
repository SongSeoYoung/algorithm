import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var bannedId: [[String]] = Array(repeating: Array(repeating: "*", count: 0), count: banned_id.count)
    for i in 0..<banned_id.count {
        let sameLength: [String] = user_id.filter{ $0.count == banned_id[i].count }
        let ban: [Character] = Array(banned_id[i])

        //banned id 찾아내기
        for s in sameLength {
            var checking: Bool = false
            for l in 0..<Array(s).count {
                if l == Array(s).count - 1 {
                    if ban[l] != "*" {
                        if ban[l] == Array(s)[l] { checking = true }
                    } else { checking = true }
                }
                else if ban[l] != "*" && ban[l] != Array(s)[l] { break }
            }
            if checking { bannedId[i].append(s) }
        }
    }
    
    print(bannedId)
    //조합구해야함
//    var answer: Set<Set<String>> = Set<Set<String>>()
//    for i in 0..<bannedId.count {
//        for j in 0..<bannedId[i].count {
//            answer.insert( Set(arrayLiteral: bannedId[i][j]))
//        }
//    }
//    print(answer)
    return 0
}

solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"])
