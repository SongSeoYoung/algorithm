import Foundation

class FastIO {
    private let buffer: [UInt8]
    private var index: Int = 0
    private let fhOutput: FileHandle = FileHandle.standardOutput

    init(fhInput: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fhInput.readToEnd()!) + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 {
            now = read()
        }

        if now == 45 {
            isPositive.toggle(); now = read()
        }

        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }

        return sum * (isPositive ? 1 : -1)
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 {
            now = read()
        }

        let beginIndex = index - 1

        while now != 10,
              now != 32,
              now != 0 {
            now = read()
        }

        return Array(buffer[beginIndex..<(index - 1)])
    }

    @inline(__always) func print(_ s: String) {
        fhOutput.write(s.data(using: .utf8)!)
    }
}


func solution() -> String {
    
//    let fio = FastIO()/
    var n = Array(String(readLine()!)).map { String($0)}
    
    if !n.contains("0") {
        return "-1"
    }
    
    n.sort(by: >)
    
    
    
    var answer = ""
    
    var newNumber = n.reduce("") { $0 + $1 }
//    var newNumberInt = UInt(newNumber)!
    
    
    var check = Int.init()
    for n in n.map { Int($0)! } {
        check += n
    }
    if check % 3 == 0 {
        answer = newNumber
    } else {
        answer = "-1"
    }
    
    return answer
}
print(solution())
