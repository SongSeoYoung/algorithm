import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var arr:[[Int]] = [[Int]]()
    var counting = priorities.count
    var count: Int = 0
    for i in 0..<priorities.count {
        arr.append([priorities[i], i])
    }
    
    while counting > 1{
        var check:Bool = true
        for i in 1..<counting {
            check = true
            if arr[0][0] < arr[i][0] {
                print(arr)
//                print("\(arr[0][0]) 우선순위가 작습니다. 뒤로 넣습니다.")
                arr.append(arr.remove(at: 0))
                check = false
                break
            }
        }
        if check {
//            print("check is true! 즉 나는 제일 큽니다.")
//            print(arr)
//            print(arr[0][0],"이 제일 커서 카운트 증가시키고 지웁니다.")
            if arr[0][1] == location {
                count = count + 1
                return count
            }
            count = count + 1
            arr.remove(at: 0)
            counting = counting - 1
//            print(arr)
        }
        
    }
    return count
}

print(solution([1, 1, 9, 1, 1, 1], 0))
