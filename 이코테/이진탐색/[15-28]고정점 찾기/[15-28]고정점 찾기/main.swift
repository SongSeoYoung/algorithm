func binarySearch(arr: [Int], start: Int, end: Int) -> Int? {
    var start = start
    var end = end
    while start <= end {
        let mid = (start + end) / 2
        if arr[mid] == mid {
            return mid
        } else if arr[mid] < mid {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return nil
}

func solution () {
    let n = Int(String(readLine()!))!
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    if let result = binarySearch(arr: arr, start: 0, end: arr.count) {
        print(result)
    }else {
        print(-1)
    }
}

solution()
