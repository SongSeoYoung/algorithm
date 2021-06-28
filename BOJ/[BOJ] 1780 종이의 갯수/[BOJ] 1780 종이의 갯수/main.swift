//import Foundation
//
//class FastIO {
//    private let buffer: [UInt8]
//    private var index: Int = 0
//    private let fhOutput: FileHandle = FileHandle.standardOutput
//
//    init(fhInput: FileHandle = FileHandle.standardInput) {
//        buffer = Array(try! fhInput.readToEnd()!) + [UInt8(0)]
//    }
//
//    @inline(__always) private func read() -> UInt8 {
//        defer { index += 1 }
//        return buffer[index]
//    }
//
//    @inline(__always) func readInt() -> Int {
//        var sum = 0
//        var now = read()
//        var isPositive = true
//
//        while now == 10 || now == 32 {
//            now = read()
//        }
//
//        if now == 45 {
//            isPositive.toggle(); now = read()
//        }
//
//        while now >= 48, now <= 57 {
//            sum = sum * 10 + Int(now - 48)
//            now = read()
//        }
//
//        return sum * (isPositive ? 1 : -1)
//    }
//
//    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
//        var now = read()
//
//        while now == 10 || now == 32 {
//            now = read()
//        }
//
//        let beginIndex = index - 1
//
//        while now != 10,
//              now != 32,
//              now != 0 {
//            now = read()
//        }
//
//        return Array(buffer[beginIndex..<(index - 1)])
//    }
//
//    @inline(__always) func print(_ s: String) {
//        fhOutput.write(s.data(using: .utf8)!)
//    }
//}
//
//
//func solution() {
//    let fio = FastIO()
//    var size = fio.readInt()
//
//    var arr = [[Int]]()
//    for _ in 0..<size {
//        var list = [Int]()
//        for _ in 0..<size {
//            list.append(fio.readInt())
//        }
//        arr.append(list)
//    }
//    var visited = Array(repeating: Array(repeating: false, count: size), count: size)
//
//    var zeroCount = 0
//    var oneCount = 0
//    var minusCount = 0
//    func cutting(number: Int, yStart: Int, xStart: Int) {
//        let initV = arr[yStart][xStart]
//        if number == 1 {
//            visited[yStart][xStart] = true
//            if initV == 0 { zeroCount += 1 }
//            if initV == 1 { oneCount += 1 }
//            if initV == -1 { minusCount += 1 }
//            return
//        }
//        for y in yStart..<yStart + number {
//            for x in xStart..<xStart + number {
//                if (initV != arr[y][x]) && (visited[y][x] == false){
//                    visited[y][x] = true
////                    print("y", y, "x", x, "에서 맞지않음")
//                    cutting(number: number/3, yStart: yStart, xStart: xStart)   //좌상단
//                    cutting(number: number/3, yStart: yStart + (number / 3), xStart: xStart) //좌2째줄
//                    cutting(number: number/3, yStart: yStart + ((number * 2) / 3 ), xStart: xStart) //좌3재줄
//                    cutting(number: number/3, yStart: yStart, xStart: xStart+(number / 3)) //상단 가운데
//                    cutting(number: number/3, yStart: yStart+(number / 3), xStart: xStart+(number / 3))   //중앙
//                    cutting(number: number/3, yStart: yStart+((number * 2) / 3), xStart: xStart+(number / 3))  //중앙하단
//                    cutting(number: number/3, yStart: yStart, xStart: xStart+((number * 2) / 3))   //상단 오른쪽
//                    cutting(number: number/3, yStart: yStart+(number / 3), xStart: xStart+((number * 2) / 3))
//                    cutting(number: number/3, yStart: yStart+((number * 2) / 3), xStart: xStart+((number*2)/3))
//                }
//                else if (initV == arr[y][x]) && (y != yStart + number - 1) && (x != xStart + number - 1 ) && (visited[y][x] == false) {
//                    visited[y][x] = true
//                }
//                else if (y == yStart + number - 1) && (x == xStart + number - 1 ) && (visited[y][x] == false ){
//                    visited[y][x] = true
////                    print("모두 같아요! ", initV)
//                    if initV == 0 { zeroCount += 1 }
//                    if initV == 1 { oneCount += 1 }
//                    if initV == -1 { minusCount += 1 }
//                    return
//                }
//            }
//        }
//    }
//    cutting(number: size, yStart: 0, xStart: 0)
//    print(minusCount)
//    print(zeroCount)
//    print(oneCount)
//}
//
//
//solution()

func solution() {
    var size = Int(String(readLine()!))!
    
    var arr = [[Int]]()
    for i in 0..<size {
        var list = Array(readLine()!).split(separator: " ").map { Int(String($0))! }
        arr.append(list)
    }
    var visited = Array(repeating: Array(repeating: false, count: size), count: size)
    
    var zeroCount = 0
    var oneCount = 0
    var minusCount = 0
    func cutting(number: Int, yStart: Int, xStart: Int) {
        let initV = arr[yStart][xStart]
        if number == 1 {
            visited[yStart][xStart] = true
            if initV == 0 { zeroCount += 1 }
            if initV == 1 { oneCount += 1 }
            if initV == -1 { minusCount += 1 }
            return
        }
        for y in yStart..<yStart + number {
            for x in xStart..<xStart + number {
                if (initV != arr[y][x]) && (visited[y][x] == false){
                    visited[y][x] = true
//                    print("y", y, "x", x, "에서 맞지않음")
                    cutting(number: number/3, yStart: yStart, xStart: xStart)   //좌상단
                    cutting(number: number/3, yStart: yStart + (number / 3), xStart: xStart) //좌2째줄
                    cutting(number: number/3, yStart: yStart + ((number * 2) / 3 ), xStart: xStart) //좌3재줄
                    cutting(number: number/3, yStart: yStart, xStart: xStart+(number / 3)) //상단 가운데
                    cutting(number: number/3, yStart: yStart+(number / 3), xStart: xStart+(number / 3))   //중앙
                    cutting(number: number/3, yStart: yStart+((number * 2) / 3), xStart: xStart+(number / 3))  //중앙하단
                    cutting(number: number/3, yStart: yStart, xStart: xStart+((number * 2) / 3))   //상단 오른쪽
                    cutting(number: number/3, yStart: yStart+(number / 3), xStart: xStart+((number * 2) / 3))
                    cutting(number: number/3, yStart: yStart+((number * 2) / 3), xStart: xStart+((number*2)/3))
                }
                else if (initV == arr[y][x]) && (y != yStart + number - 1) && (x != xStart + number - 1 ) && (visited[y][x] == false) {
                    visited[y][x] = true
                }
                else if (y == yStart + number - 1) && (x == xStart + number - 1 ) && (visited[y][x] == false ){
                    visited[y][x] = true
//                    print("모두 같아요! ", initV)
                    if initV == 0 { zeroCount += 1 }
                    if initV == 1 { oneCount += 1 }
                    if initV == -1 { minusCount += 1 }
                    return
                }
            }
        }
    }
    cutting(number: size, yStart: 0, xStart: 0)
    print(minusCount)
    print(zeroCount)
    print(oneCount)
}


solution()

