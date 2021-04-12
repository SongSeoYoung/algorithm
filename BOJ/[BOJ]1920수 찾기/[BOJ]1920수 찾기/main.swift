import Foundation

func solution() {
    _ = Int(String(readLine()!))
    var aArr = readLine()!.split(separator: " ").map { Int(String($0))! }
    aArr.sort()
    _ = Int(String(readLine()!))
    let bArr = readLine()!.split(separator: " ").map { Int(String($0))! }
    for i in 0..<bArr.count {
        print(binarySearch(arr: aArr, target: bArr[i]))
    }
   
}
func binarySearch(arr: [Int], target: Int) -> Int {
    var start = 0
    var end = arr.count - 1
    if target < arr[0] {
        return 0
    } else if target > arr[arr.count - 1] {
        return 0
    }
    while start <= end {
        let mid = (start + end) / 2
        if arr[mid] == target {
            return 1
        } else if arr[mid] < target {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    return 0
}

solution()
