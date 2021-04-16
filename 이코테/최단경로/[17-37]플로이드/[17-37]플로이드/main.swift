func solution() {
    let n = Int(String(readLine()!))!
    let m = Int(String(readLine()!))!
    var arr = Array(repeating: Array(repeating: 987654321, count: n), count: n)
    for i in 0..<m {
        let info = readLine()!.split(separator: " ").map { Int(String($0))! }
        arr[info[0]-1][info[1]-1] = min(arr[info[0]-1][info[1]-1], info[2])
    }
    for i in 0..<n {
        for y in 0..<n {
            for x in 0..<n {
                if y == x { arr[y][x] = 0 }
                else {
                    arr[y][x] = min(arr[y][x], arr[y][i] + arr[i][x])
                }
            }
        }
    }
    for i in 0..<n {
        for j in 0..<n {
            arr[i][j] == 987654321 ? print(0, terminator: " ") : print(arr[i][j], terminator: " ")
        }
        print("")
    }
}
solution()
