//import Foundation
//
//func solution(_ numbers:[Int], _ target:Int) -> Int {
//    var arr = Array(repeating: [[0],[0],[0]], count: numbers.count)
//    for i in 0..<numbers.count {
//        arr[i][0][0] = numbers[i]
//        if i == 0{
//            arr[i][1] = [numbers[i]]
//            arr[i][2] = [0]
//        }
//    }
//    print(arr)
//    for i in 1..<numbers.count {
//        if i == i {
//            arr[i][1] = arr[i-1][1].map { $0 + arr[i][0][0]}
//            arr[i][2] = arr[i-1][1].map { $0 - arr[i][0][0]}
//        }
//        else{
//            arr[i][1] = Array(contentsOf: arr[i-1][1].map { $0 + arr[i][0][0]} + arr[i-1][2].map { $0 + arr[i][0][0] } )
//            arr[i][2] = arr[i-1][1].map { $0 - arr[i][0][0]} + arr[i-1][2].map { $0 - arr[i][0][0] }
//        }
//    }
//    print(arr)
//    return 0
//}
//
//solution([1,1,1,1,1], 3)


//정답코드
func solution(_ numbers:[Int], _ target:Int) -> Int {
  var count = 0
  
  func DFS(index: Int, sum: Int) {
    if index == (numbers.count - 1) && sum == target { // 마지막 인덱스까지 모두 계산한 값이 target과 같다면
      count += 1 // count를 +1해주고
      return // 더 이상 계산할 값이 없으므로(자식노드가 없으므로) return 해준다
    }

    guard index + 1 < numbers.count else { return }
    
    DFS(index: index+1, sum: sum + numbers[index + 1]) // +자식 노드 실행
    DFS(index: index+1, sum: sum - numbers[index + 1]) // -자식 노드 실행
  }
  
  DFS(index: -1, sum: 0)
  
  return count
}
print(solution([1,1,1,1,1], 3))
