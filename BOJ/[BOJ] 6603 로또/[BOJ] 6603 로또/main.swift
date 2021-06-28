func solution() {
    while true {
        var arr = Array(readLine()!).split(separator:  " ").map { Int(String($0))! }
        if arr.count == 1 {
            break
        }
        arr.removeFirst()
        let N = arr.count
        let M = 6
        var numberArr: [Int] = Array(repeating: 0, count: M)
        var visited = Array(repeating: false, count: N+1)
        func backtracking(index: Int) {
            
            if index == M {
                    for i in 0..<M {
                        print(numberArr[i], terminator: " ")
                    }
                    print()
                    return
            } else {
                for i in 0..<N {
                    if visited[i] == false {
                        if index != 0 && numberArr[index-1] < arr[i] {
                            numberArr[index] = arr[i]
                            visited[i] = true
                            backtracking(index: index+1)
                            //return 부르면 바로 여기로옴
                            visited[i] = false
                        } else if index == 0 {
                            numberArr[index] = arr[i]
                            visited[i] = true
                            backtracking(index: index+1)
                            //return 부르면 바로 여기로옴
                            visited[i] = false
                        }
                    }
                }
            }
        }
        backtracking(index: 0)
        print()
    }
}

solution()


// 인터넷 코드
/*
while let input = readLine() {
    if input == "0" {
        break
    }

    let nums = Array(input.split(separator: " ").map { Int(String($0))! })
    let n = nums.count

    var picked = [String]()
    var visited = Array(repeating: false, count: n)
    func pick(toPick: Int) {
        if toPick == 0 {
            print(picked.joined(separator: " "))
            return
        }

        for i in 1..<n {
            if visited[i] {
                continue
            }
            if !picked.isEmpty && Int(picked.last!)! > nums[i] {
                continue
            }
            visited[i] = true
            picked.append("\(nums[i])")
            pick(toPick: toPick - 1)
            picked.removeLast()
            visited[i] = false
        }
    }

    pick(toPick: 6)
    print()
}
*/
