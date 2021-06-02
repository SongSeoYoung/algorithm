import Foundation


func solution() {
    let testCase = Int(String(readLine()!))!
    for i in 0..<testCase {
        let number = Int(String(readLine()!))!
        var typeArr = [String]()
        var arr = [[String]]()
        for _ in 0..<number {
            let input = readLine()!.split(separator: " ").map { String($0) }
            if typeArr.isEmpty {
                typeArr.append(input[1])
                arr = [[input[0]]]
            } else {
                if typeArr.contains(input[1]) {
                    let index = typeArr.firstIndex(of: input[1])
                    arr[index!].append(input[0])
                } else {
                    typeArr.append(input[1])
                    arr.append([input[0]])
                }
            }
        }
//        print(typeArr)
//        print(arr)
        if typeArr.count == 1 { print(arr[0].count) }
        else {
            var result = 0
            var count = [Int]()
            for l in 0..<arr.count {
                count.append(arr[l].count + 1)
            }
            result = count.reduce(1) { $0 * $1 }
            result -= 1
            print(result)
        }
    }
}
solution()
