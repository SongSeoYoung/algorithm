func solution() {
    let number = Int(String(readLine()!))!
    var arr = [[Int]]()
    for i in 0..<number {
        if i == 0 {
            arr.append([0,0])
        }
        arr.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }
    print(arr)
    
    var dp = Array(repeating: 0, count: number + 1)
    var checking = Array(repeating: [Int](), count: number+2)
    print(checking)
    for i in 1...number {
        print(" ")
        print(i, "번째 날.  오늘의 상담", arr[i][0], arr[i][1])
        var check = 0
        if arr[i][0] + i - 1 <= number {
            dp[i] = arr[i][1]
            if arr[i][0] != 1 {
                checking[arr[i][0] + i].append(i)
                print(arr[i][0] + i, "의 날에다가 끝남을 알림")
            }
            if !checking[i].isEmpty {
                check = dp[i]
                for l in 0..<checking[i].count {
                    if checking[i][l] != i {
                        print(checking[i][l], "날의 dp를 더할 수 있다")
                        check = dp[checking[i][l]]
                    }
                }
            }
            if arr[i-1][0] == 1 {
                dp[i] += max(check, dp[i-1])
            }
        } else {
            print("해당되는게 엉ㅂㅅ댜~")
            if !checking[i].isEmpty {
                check = dp[i]
                for l in 0..<checking[i].count {
                    if checking[i][l] != i {
                        print(checking[i][l], "날의 dp를 더할 수 있다")
                        check = dp[checking[i][l]]
                    }
                }
            }
            dp[i] += (check+dp[i-1])
        }
        print(dp)
    }
}

solution()
