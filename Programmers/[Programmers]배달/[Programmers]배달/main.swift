
import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var array = Array(repeating: Array(repeating: 0, count: N), count: N)
    func makeArray() {
        for i in 0..<road.count {
            let a = road[i][0] - 1
            let b = road[i][1] - 1
            let cost = road[i][2]
            if array[a][b] != 0 {
                array[a][b] = min(array[a][b], cost)
                array[b][a] = min(array[a][b], cost)
            }else{
                array[a][b] = cost
                array[b][a] = cost
            }
        }
    }
    //1마을에서 갈 수 있는 마을
    var available = Set<Int>()
    makeArray()
    var queue = [0]
    available.insert(0)
    func bfs() {
        while !queue.isEmpty {
            queue.sort()
            let last = queue.removeFirst()
            for i in last+1..<N {
                if array[last][i] != 0 && array[last][i] <= k {
                    queue.append(i)
                    available.insert(i)
                    addingCost(y: i, width: i, cost: array[last][i])
                }
            }
        }
    }
    bfs()

    func addingCost(y: Int, width: Int, cost: Int){
        for i in width + 1..<N {
            if array[width][i] != 0 {
                array[width][i] += cost
            }
        }
    }
    return available.count
}
