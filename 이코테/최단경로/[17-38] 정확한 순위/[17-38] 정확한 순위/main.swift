func solution() {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let student = info[0]
    let compareN = info[1]
    
    var arr = Array(repeating: Array(repeating: 987654321, count: student), count: student)
    for _ in 0..<compareN {
        let list = readLine()!.split(separator: " ").map{Int(String($0))! }
        arr[list[0] - 1][list[1] - 1] = 1
    }
  
    for i in 0..<student {
        for y in 0..<student {
            for x in 0..<student {
                arr[y][x] = min(arr[y][x], arr[y][i] + arr[i][x])
            }
        }
    }

    var count = Set<Int>()
    var result = [Int]()
    for i in 0..<student {
        count = []
        // 내가 가르키는거 인덱스번호 추가
        for l in 0..<student {
            if l != i && arr[i][l] != 987654321 {
                count.insert(l)
            }
        }
        // 나를 가르키는거 인덱스번호 추가
        for l in 0..<student {
            if !count.contains(l) && l != i{
                if arr[l][i] != 987654321 {
                    count.insert(l)
                }
            }
        }
        // 내가 가르키는거 + 나를 가르키는거 == 전체 노드수 에서 나를 뺀거랑 같으면
        // 등수가 정해질 수 있다는 것 (건너서 나를 가르키거나, 내가 가르키니까 위치파악이 가능)
        if count.count == student - 1 {
            result.append(i + 1)
        }
    }
    print(result.count)
}

solution()

/*
 6 6
 1 5
 3 4
 4 2
 4 6
 5 2
 5 4
 */
