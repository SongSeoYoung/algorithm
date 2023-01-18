func solution(_ msg:String) -> [Int] {
    let alphabets = ["A","B","C","D", "E", "F", "G","H","I", "J", "K","L","M","N","O", "P","Q","R","S","T","U","V","W","X","Y","Z"]
    var dic: [String: Int] = [:]
    alphabets.enumerated().forEach { index, alphabet in
        dic[alphabet] = index + 1
    }
    let msgArray = Array(msg).map { String($0) }
    
    var answer: [Int] = []
    var temp: String = ""
    msgArray.forEach { character in
        temp += character
    
        if let value = dic[temp] {
          print("있다")
            
        } else {
           print("없다")
            let _temp = temp
            let lastDicString = String(temp.dropLast())
            guard let value = dic[lastDicString] else { return }
            answer.append(value)
            dic[_temp] = dic.count + 1
            temp = character
        }
    }
    answer.append(dic[temp] ?? 0)
    return answer
}

print("🙂",solution("TOBEORNOTTOBEORTOBEORNOT"))
