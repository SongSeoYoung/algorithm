/*
 풀이시간 : 5분
 가장 최적의 답을 구하기 위해서 (가장 많은 그룹 만들기) 공포도가 큰 사람을 안데리고가는게 최고다. (공포도가 큰 사람은 그 만큼 비용이 많이들어가니까)
 그래서 오름차순으로 공포도를 정렬하고 가장 작은 것들부터 그룹을 만들어나가는 방식을 채택함.
 그룹을 만들 때 점차 큰 수가 stack에 들어가니까 결과적으로 stack의 갯수 (그룹 안의 사람 수)와 스택에서 가장 큰 공포도를 가진 사람의 공포도가 같아야 그룹이 온전히 만들어진 셈이 되어진다.
 */

import Foundation

func solution(n: Int, arr: [Int]) -> Int {
    var group = 0
    var stack = [Int]()
    let arr = arr.sorted()
    for a in arr {
        stack.append(a)
        if stack.count == stack.max() {
            group += 1
            stack = []
        }
    }
    return group
}

print(solution(n: 5, arr: [2,3,1,2,2]))
