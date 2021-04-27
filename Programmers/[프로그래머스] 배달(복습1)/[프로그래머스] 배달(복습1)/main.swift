import Foundation

/*
func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    var node: [[[Int]]] = Array(repeating: [[Int]](), count: N)
    var visited = Array(repeating: false, count: N)
    var distance = Array(repeating: 10001, count: N)
    
    for i in 0..<road.count {
        node[road[i][0]-1].append([road[i][1]-1, road[i][2]])
        node[road[i][1]-1].append([road[i][0]-1, road[i][2]])
    }
    print(node)
    distance[0] = 0
    visited[0] = true
    
    // distance에서 방문x이면서 가장 짧은거리인 인덱스 반환용 함수
    func getShortDistance() -> Int {
        var minValue = Int.max
        var index = 0
        for i in 0..<N {
            if distance[i] < minValue && (!visited[i]) {
                minValue = distance[i]
                index = i
            }
        }
        return index
    }
    // 시작 점 관련해서 연결된 길이 있다면 디스턴스 갱신하기
    for info in node[0]{
        let destination = info[0]
        let value = info[1]
        distance[destination] = value
    }
    
    // 전체 노드에대해서
    for _ in 0..<N {
        // 방문한적없으면서 최단거리인 인덱스 반환해서 거기 들렀다가는거 길이가 최소면 갱신하자!
        let currentShort = getShortDistance()
        visited[currentShort] = true
        
        for j in node[currentShort] {
            let cost = distance[currentShort] + j[1]
            if cost < distance[j[0]] {
                distance[j[0]] = cost
            }
        }
        
    }
    //    print(distance)
    for i in distance{
        if distance[i] <= k {
            answer += 1
        }
    }
    return answer
}
//print(solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3))


func solution2(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var arr = Array(repeating: Array(repeating: 987654321, count: N+1), count: N+1)
    for i in 0..<road.count {
        if arr[road[i][0]][road[i][1]] == 987654321 {
            arr[road[i][0]][road[i][1]] = road[i][2]
        } else{
            arr[road[i][0]][road[i][1]] = min(road[i][2],arr[road[i][0]][road[i][1]])
        }
        if arr[road[i][1]][road[i][0]] == 987654321 {
            arr[road[i][1]][road[i][0]] = road[i][2]
        } else{
            arr[road[i][1]][road[i][0]] = min(road[i][2],arr[road[i][1]][road[i][0]])
        }
    }

    var distance = Array(repeating: 987654321, count: N+1)
    var visited = Array(repeating: false, count: N+1)
    
    // distance에서 방문x이면서 가장 짧은거리인 인덱스 반환용 함수
    func getShortDistance() -> Int {
        var minValue = Int.max
        var index = 0
        for i in 0..<N {
            if distance[i] < minValue && (!visited[i]) {
                minValue = distance[i]
                index = i
            }
        }
        return index
    }
    distance[1] = 0
    visited[1] = true
    // 시작 점 관련해서 연결된 길이 있다면 디스턴스 갱신하기
    for i in 0..<arr[1].count{
        let destination = i
        let value = arr[1][i]
        distance[destination] = value
    }
    
    // 전체 노드에대해서
    for _ in 0..<N {
        // 방문한적없으면서 최단거리인 인덱스 반환해서 거기 들렀다가는거 길이가 최소면 갱신하자!
        let currentShort = getShortDistance()
        visited[currentShort] = true
        
        for j in 0..<arr[currentShort].count {
            let cost = distance[currentShort] + arr[currentShort][j]
            if cost < distance[j] {
                distance[j] = cost
            }
        }
        
    }

    var answer = 0
    for i in 0..<distance.count{
        if distance[i] <= k {
            answer += 1
        }
    }
    return answer
}
*/

func solution3(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var queue = [Int]()
    var arr = Array(repeating: Array(repeating: 987654321, count: N+1), count: N+1)
    for i in 0..<road.count {
        if arr[road[i][0]][road[i][1]] == 987654321 {
            arr[road[i][0]][road[i][1]] = road[i][2]
        } else{
            arr[road[i][0]][road[i][1]] = min(road[i][2],arr[road[i][0]][road[i][1]])
        }
        if arr[road[i][1]][road[i][0]] == 987654321 {
            arr[road[i][1]][road[i][0]] = road[i][2]
        } else{
            arr[road[i][1]][road[i][0]] = min(road[i][2],arr[road[i][1]][road[i][0]])
        }
    }
    var distance = Array(repeating: 987654321, count: N+1)
    var visited = [Int]()
    queue.append(1)
    visited.append(1)
    distance[1] = 0
    while !queue.isEmpty {
        let start = queue.remove(at: 0)
        for i in 1...N {
            if distance[i] > arr[start][i] + distance[start] {
                distance[i] = arr[start][i] + distance[start]
                queue.append(i)
                visited.append(i)
            }
        }
    }
    var answer = 0
    for i in 1...N {
        if distance[i] <= k {
            answer += 1
        }
    }
    return answer
}

print(solution3(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3))
