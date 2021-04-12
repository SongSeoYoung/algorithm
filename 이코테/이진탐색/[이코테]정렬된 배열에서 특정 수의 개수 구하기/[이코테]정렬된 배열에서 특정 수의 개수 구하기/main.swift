func solution() {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    let result = binarySearch(arr: arr, target: info[1], start: 0, end: arr.count - 1)
    
    print(result)
}

func binarySearch(arr: [Int], target: Int, start: Int, end: Int) -> Int {
    var count = 0
    var start = start
    var end = end
    while start <= end {
        let mid = (start + end) / 2
        if arr[mid] == target {
            var copyMid = mid
            while arr[copyMid] == target {
                count += 1
                copyMid -= 1
            }
            copyMid = mid + 1
            while arr[copyMid] == target {
                count += 1
                copyMid += 1
            }
            return count
        } else if arr[mid] < target {
            start = mid + 1
        } else if arr[mid] > target {
            end = mid - 1
        }
    }
    return -1
}

solution()
