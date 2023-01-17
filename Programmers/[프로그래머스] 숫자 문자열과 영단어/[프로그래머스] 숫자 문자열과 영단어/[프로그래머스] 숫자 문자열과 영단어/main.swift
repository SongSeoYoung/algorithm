import Foundation

enum NumberString: Character, CaseIterable {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    
    var numberString: String {
        switch self {
        default: return "\(self)"
        }
    }
}

func solution(_ s: String) -> Int {
    let numbers: [Character] = NumberString.allCases.map(\.rawValue)
    var answer: String = ""
    
    var temp: String = ""
    s.forEach { character in
        if numbers.contains(character) {     // 숫자라면
            
            // MARK: (이전 값들 처리)
            if !temp.isEmpty {    // 그런데 temp에 무언가 있으면 그건 영어의 값들.
                if let index = findNumber(for: temp) { // 영어에 맞는 숫자를 찾는다
                    answer.append("\(index)")
                }
            }
            
            // MARK: 지금 값 처리
            answer.append(character)
            temp = ""   // 초기화
            
        } else {      // 숫자가 아니면
            if let index = findNumber(for: temp) { // 영어에 맞는 숫자를 찾는다
                answer.append("\(index)")
                temp = ""
            }
            temp.append(character)
        }
    }
    if let index = findNumber(for: temp) { // 영어에 맞는 숫자를 찾는다
        answer.append("\(index)")
        temp = ""
    }
    return Int(answer) ?? 0
}

private func findNumber(for string: String) -> Int? {
    let numberStrings: [String] = NumberString.allCases.map(\.numberString)
    return numberStrings.firstIndex(of: string)
}
print(solution("one4seveneight"))
