func solution() {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = info[0]
    let m = info[1]
    
    var list = readLine()!.split(separator: " ").map { Int(String($0))! }
    list.sort()
 
    var start = 0
    var end = list.last!
    var result = 0
    while start <= end {
        
        var sum = 0
        let mid = (start + end ) / 2
        for i in 0..<list.count {
            if list[i] > mid {
                sum += (list[i] - mid)
            }
        }
        if sum < m {
            end = mid - 1
        }else{
            result = mid
            start = mid + 1
        }
    }
    print(result)
}

solution()


// 떡볶이를 절단기에 잘라서 잘린 만큼을 판매한다.
// 입력값으로 N,m을 받는데 이 때 m이 손님이 원하는 양.
// 그 양을 만들기위해 절단기 사이즈를 계속해서 조절해야한다.
// 해당 양을 주기 위한 절단기의 최대사이즈를 구해야함, (그러니 손님에게는 딱!!!  떨어지게 줄 수 있게)
// 그러기 위해서 절단기크기를 이진탐색으로 찾는다.
// 잘랐을 때 양이랑 target을 비교해서, target이 잘린 양보다 작으면 절단기를 크게해서 더 덜잘리도록..
// target이 잘려진거보다 크면 절단기높이를 더 줄여야지 잘린게 많아지니까 target이랑 똑같아지겠지
