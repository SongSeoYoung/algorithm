import Foundation

var parents = [Int]()
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    let costsArr = costs.sorted(by: sortedByCost(_:_:))
    print(costsArr)
    parents = (0..<n).map{$0}
    var count = 0
    for i in 0..<costsArr.count {
        if parents[costsArr[i][0]] == parents[costsArr[i][1]] {
            print("cycle")
            continue
        }
        else {
            print("부모 바꾸기")
            setEdge(left: costsArr[i][0], right: costsArr[i][1])
            count += costsArr[i][2]
        }
        print(count)
        print(parents)
    }
    print(count)

    return count
}

func sortedByCost(_ n1: [Int], _ n2: [Int])-> Bool {
    if n1[2] < n2[2] {
        return true
    }else{
        return false
    }
}

func setEdge(left: Int, right: Int) {
    //새로운ㅇ부모는 값이 작아야하고 , 위치상 왼쪽에 있으니 left값이고
    //옛날 부모 즉, 큰 부모를 가지고있는 모든 노드들에 대해서 바꿔줘야함.
    changeparent(oldParent: findParent(child: right), newParent: findParent(child: left))
}
func findParent(child:Int) -> Int {
    //parrentArray의 child번째가 child라면 가장 위 부모 아니라면 재귀해줌
    return parents[child] == child ? child : findParent(child:parents[child])
}
func changeparent(oldParent: Int, newParent: Int) {
    //이전 것과 같은 부모를 가지는 것들을 indices.filter 로 찾아서 배열을 하나 만들고
    //그 배열에 forEach 문을 실행시켜서 올드부모를 가지는 것을 새로운 것으로 다 바꿔줌. (새로운 것 = 작은 것 = 왼쪽)
    parents.indices.filter { parents[$0] == oldParent }.forEach{ parents[$0] = newParent}
}
print(solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]))




/*
 import Foundation

 func solution(_ n:Int, _ costs:[[Int]]) -> Int {
     var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
     for i in 0..<((n-1) * n) / 2 {
         if i == costs.count {
             break
         }
         let cost = costs[i]
         arr[cost[0]][cost[1]] = cost[2]
         arr[cost[1]][cost[0]] = cost[2]
     }
     
     var number = Array(repeating: 0, count: n)
     for h in 0..<n {
         for w in h..<n {
             if number[w] == 0{
                 number[w] = arr[h][w]
             }
             else{
                 if arr[h][w] == 0 {
                     number[w] = number[w]
                 }else{
                 number[w] = min(number[w], arr[h][w])
                 }
             }
         }
     }
     return number.reduce(0){ $0 + $1 }
 }
 */
