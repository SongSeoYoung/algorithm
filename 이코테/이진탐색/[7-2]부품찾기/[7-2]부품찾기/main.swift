func solution() {
    
    let totalN = Int(readLine()!)!
    var totalArr = readLine()!.split(separator: " ").map { Int(String($0))! }
    totalArr.sort()
    
    func binarySearch(start: Int, end: Int, target: Int, arr: [Int]) -> Int {
        var start = start
        var end = end
        while start <= end {
            let mid: Int = (start + end) / 2
            if arr[mid] < target {
                start = mid + 1
            }
            else if arr[mid] == target {
                return mid
            }
            else {
                end = mid - 1
            }
        }
        return -1
    }

    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    for i in 0..<arr.count {
        if binarySearch(start: 0, end: totalArr.count-1, target: arr[i], arr: totalArr) != -1 {
            print("yes", terminator: " ")
        }
        else {
            print("no", terminator: " ")
        }
    }
}

solution()
