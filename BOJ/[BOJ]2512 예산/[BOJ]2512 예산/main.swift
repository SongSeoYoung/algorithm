func solution() {
    let number = Int(String(readLine()!))!
    var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.sort()
    let sum = arr.reduce(0) { $0 + $1 }
    let limit = Int(String(readLine()!))!
    if sum > limit {
        print(binarySearch(arr: arr, start: arr[0], end: arr.last!, limit: limit))
    } else {
        print(arr.last!)
    }
}

func binarySearch(arr: [Int] , start: Int, end: Int, limit: Int) -> Int {

    var start = 0
    var end = end
    var result = 0

    while start <= end {
        var amount = 0
        let mid = (start + end ) / 2
        for i in 0..<arr.count {
            if arr[i] > mid {
                amount += mid
            } else { amount += arr[i] }
        }
        if amount > limit {
            end = mid - 1
        } else {
            result = mid
            start = mid + 1
        }
    }
    return result
}

solution()
