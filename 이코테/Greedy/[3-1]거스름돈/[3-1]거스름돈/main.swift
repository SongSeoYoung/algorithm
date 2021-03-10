import Foundation

func solution(n: Int) -> Int {
    var n = n
    var coins = [10,50,100,500]
    coins = coins.sorted(by: >)     // 내림차순 정렬
    var count = 0
    for coin in coins {     //동전들을 가장 큰 것 부터 순서대로
        count += n / coin       //몇 개 쓸거냐면, 줘야할 돈에서 가장 크게 나눠서 줄 수 있는 몫만큼
        n = n % coin        //그리고 줘야할 돈은 그 해당 돈을 줬을 때의 나머지
    }
    return count
}

print(solution(n: 1260))


 // MARK: - 정리

/*
 총 수행시간 O(k) 동전의 갯수에 따라서 시간이 달라짐
 */
