func solution() {
    var number = Int(readLine()!)!
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: number + 1), count: number + 1)
    for i in 0..<number {
        let info = readLine()!.split(separator: " ").map { Int($0)! }
        arr[info[0]][info[1]] = 1
        arr[info[0]][info[1]] = 2
    }
    for i in 1...number {
        while true {
            for j in 1...number {
                
            }
        }
    }
}
