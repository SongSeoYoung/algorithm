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


func solution() {
    let fio = FastIO()
    let testCase = fio.readInt()
    for _ in 0..<testCase {
        let note1Count = fio.readInt()
        var dic = [Int: Bool]()
        for _ in 0..<note1Count {      //O(n)
            dic.updateValue(true, forKey:  fio.readInt())     //O(1)
        }
        let note2Count = fio.readInt()
        for _ in 0..<note2Count {      //O(m)
            if dic[fio.readInt()] == nil { print(0) }        //O(1)
            else { print(1) }
        }
    }
}
solution()

