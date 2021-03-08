//import Foundation
//func solution(_ s:String) -> String {
//    var stringArr = s.split(separator: " ")
//    var result = [String]()
//    print(stringArr)
//    for i in 0..<stringArr.count {
//        var arr = Array(stringArr[i]).map{ Character(extendedGraphemeClusterLiteral: $0) }
//        for j in 1..<arr.count {
//            arr[j] = Character(String(arr[j]).lowercased())
//        }
//        if findEn(s: arr[0]) {
//            arr[0] = Character(String(arr[0]).uppercased())
//        }
//        print(arr)
//        if i == 0 {
//            result.append(arr.reduce(""){String($0) + String($1)})
//        }else{
//            result.append(arr.reduce(" "){String($0) + String($1)})
//        }
//    }
//    return result.reduce(""){$0 + $1}
//}
//
//func findEn(s: Character) -> Bool {
//    if Int(s.asciiValue!) >= 65 && Int(s.asciiValue!) <= 90 {
//        return true
//    }
//    if Int(s.asciiValue!) >= 97 && Int(s.asciiValue!) <= 122 {
//        return true
//    }
//    return false
//}
//
//print(solution("1 A A A E F A F1 1 3 3 2 9F A E AF"))


import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var closet = [[String]]()
    for i in 0..<clothes.count {
        if !closet.contains([clothes[i][1]]) {
            closet.append([clothes[i][1]])
        }
    }
    print(closet)
    var closet2 = closet
    for i in 0..<clothes.count {
        let index = closet.firstIndex(of: [clothes[i][1]])
        closet2[index!].append(clothes[i][0])
    }
    print(closet2)
    var counting = [Int]()
    for i in 0..<closet2.count {
        closet2[i].removeFirst()
        counting.append(closet2[i].count)
    }
    print(counting)
    var sum = 0
    for i in 1...closet2.count {
        print("----------")
        let arr = combos(elements: counting, k: i)
        print(arr)
        print("----------")
        for j in 0..<arr.count {
            sum += arr[j].reduce(1){ $0 * $1}
            print(sum)
        }
    }
    return sum
}
solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]])
func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
    if k == 0 {
        return [[]]
    }

    guard let first = elements.first else {
        return []
    }

    let head = [first]
    let subcombos = combos(elements: elements, k: k - 1)
    var ret = subcombos.map { head + $0 }
    ret += combos(elements: elements.dropFirst(1), k: k)
    return ret
}

func combos<T>(elements: Array<T>, k: Int) -> [[T]] {
    return combos(elements: ArraySlice(elements), k: k)
}
