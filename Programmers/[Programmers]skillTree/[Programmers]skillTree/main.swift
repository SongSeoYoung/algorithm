import Foundation

func solution(_ skill: String, _ skillTree: [String]) -> Int{
    var skillChar: [Character] = [Character]()
    for character in skill {
        skillChar.append(character)
    }
    var result: Int = 0
    var indexNumber: [Int] = [Int]()

    for i in 0..<skillTree.count {
        indexNumber = []
        for char in skillChar{
            let indexN:Int = Array(skillTree[i]).firstIndex(of: char) ?? -1
            if indexN != -1{
                indexNumber.append(indexN)
            }else{
                indexNumber.append(999999)
            }
            
        }
        if findSort(indexNumber) != -1 {
            result = result + 1
        }
    }
    return result
}

func findSort(_ arr: [Int]) -> Int {
    for i in 0..<arr.count - 1 {
        if arr[i] > arr[i+1] {
            return -1
        }
    }
    return 1
}

//print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
