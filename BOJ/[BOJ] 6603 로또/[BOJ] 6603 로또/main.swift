func solution() {
//    while true {
        var arr = Array(readLine()!).split(separator:  " ").map { Int(String($0))! }
        if arr.count == 1 {
            print("return!")
            return
        }
        var number = 6
        arr.removeFirst()
        var totalCount = arr.count
        var numberArr = Array(repeating: 0, count: number)
        var visited = Array(repeating: false, count: arr.count)
    print(arr)
        print(numberArr)
        print(visited)
    var count = 0
    func backtracking(index: Int) {
//            print(visited)
        
            if count == number{
                numberArr.sort()
                var varr = [Int]()
//                print(visited)
                for v in 0..<visited.count {
                    if visited[v] { varr.append(v) }
                }
//                print(varr)
                for i in 0..<6 {
                    print(arr[varr[i]], terminator: " ")
                }
                print()
                return
            } else {
                for i in 0..<arr.count {
                    if visited[i] == false {
//                        print("\(arr[i]) 방문한 적 없네")
//                        print(visited)
                        numberArr[index] = arr[i]
                        visited[i] = true
                        count += 1
                        backtracking(index: index + 1)
                        //return 부르면 바로 여기로옴
//                        print("함수끝났어?")
//                        print("index \(index)")
//                        print("현재 i \(i)") //6
                        visited[i] = false
                        count -= 1
                    }
                }
            }
//            print("반복 끝남")
        }
        backtracking(index: 0)
        print()
//    }
}

solution()
