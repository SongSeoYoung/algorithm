func solution () {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    var arr = [Int]()
    for _ in 0..<info[0] {
        arr.append(Int(String(readLine()!))!)
    }
    arr.sort()
    print(binarySearch(arr: arr, start: 0, end: arr.count - 1, install: info[1])!)
}

func binarySearch(arr: [Int], start: Int, end: Int, install: Int) -> Int? {
    var minsize = arr[start + 1] - arr[start]
    var maxsize = arr[end] - arr[start]
    var answer = 0
    while (minsize <= maxsize){
        
        let target = (minsize + maxsize ) / 2
        var check = [0]
        for i in 1..<arr.count {
            if arr[i] >= arr[check.last!] + target {
                check.append(i)
            }
        }
        if check.count < install {
            maxsize = target - 1
        } else {
            minsize = target + 1
            answer = target
        }
    }
    if answer == 0 {
        var sub = [Int]()
        for i in 1..<arr.count {
            sub.append(arr[i] - arr[i-1])
        }
        return sub.min()
    }
    return answer
}
solution()

