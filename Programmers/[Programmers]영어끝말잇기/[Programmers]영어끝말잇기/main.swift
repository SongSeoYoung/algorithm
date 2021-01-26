import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var number: Int = 0
    var order: Int = 1
    var set: Set<String> = []
    var lastWord: Character?
    for i in 0..<words.count {
        if number == n {
            number = 1
            order = order + 1
        }
        else { number = number + 1 }
        
        if i == 0{
            set.insert(words[i])
            lastWord = Array(words[i])[Array(words[i]).count - 1]
        }
        else if !set.contains(words[i]) {
//            print("처음나오는 단어")
            if lastWord! == Array(words[i])[0] {
//                print("끝말잇기됨")
                set.insert(words[i])
                lastWord = Array(words[i])[Array(words[i]).count - 1]
            }
            else{
//                print("끝말잇기 안됨")
                return [number, order]
            }
        } else {
//            print("이미 나온단어")
            return [number, order]
        }
    }
    return [0,0]
}
