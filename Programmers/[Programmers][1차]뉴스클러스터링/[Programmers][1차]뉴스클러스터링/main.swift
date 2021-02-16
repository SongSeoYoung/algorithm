func solution(_ str1:String, _ str2:String) -> Int {
    let lowerStr1 = str1.lowercased()
    let lowerStr2 = str2.lowercased()
    let str1Arr: [Character] = Array(lowerStr1)
    let str2Arr: [Character] = Array(lowerStr2)
    var arr1: [String] = [String]()
    var arr2: [String] = [String]()
    for s in 0..<str1Arr.count - 1 {
        if str1Arr[s].isLetter && str1Arr[s+1].isLetter {
            arr1.append(String(str1Arr[s]) + String(str1Arr[s+1]))
        }
    }
    var intersections: [String] = [String]()
    for s in 0..<str2Arr.count - 1 {
        if str2Arr[s].isLetter && str2Arr[s+1].isLetter {
            arr2.append(String(str2Arr[s]) + String(str2Arr[s+1]))
        }
        if arr1.contains(String(str2Arr[s]) + String(str2Arr[s+1])) {
            intersections.append(String(str2Arr[s]) + String(str2Arr[s+1]))
            arr1.remove(at: arr1.firstIndex(of: String(str2Arr[s]) + String(str2Arr[s+1]))!)
            arr2.remove(at: arr2.firstIndex(of: String(str2Arr[s]) + String(str2Arr[s+1]))!)
        }
    }
    
    return (arr1+arr2+intersections).isEmpty && intersections.isEmpty ? 65536 : Int((Double(intersections.count)/Double((arr1+arr2+intersections).count)) * 65536)
}


//print(solution( "AAAA12","aa1+aa2"))
