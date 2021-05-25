import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    let n = words.count //노드수
    let c = begin
    let beginArr = Array(begin)
    
    //노드에 대한 정보를담음
    var arr: [[[Int]]] = Array(repeating: [[Int]](), count: n+1)
    
    var visitied = Array(repeating: false, count: n+1)
    
    //최단거리 저장용
    var distance = Array(repeating: 987654321, count: n+1)
    
    
    for i in 0..<words.count {
        //시작단어랑 먼저 비교해보고
        let word = Array(words[i])
        var count = 0
        for w in 0..<word.count {
            if count > 1 { break }
            if word[w] != beginArr[w] { count += 1 }
        }
        if count <= 1 {
            arr[0].append([i+1, 1])
        }
        //나 이후의 뒷 단어들에대해 정보 찾기
        for j in 0..<words.count {
            if j != i {
                count = 0
                let word2 = Array(words[j])
                for w in 0..<word.count {
                    if count > 1 {break}
                    if word[w] != word2[w] { count += 1 }
                }
                if count <= 1 {
                    arr[i+1].append([j+1, 1])
                }
            }
        }
    }
    //distance에서 방문x이면서 가장 짧은 거리의 인덱스 반환
    func getShortDistance() -> Int {
        var minValue = Int.max
        var index = 0
        for i in 0..<n {
            if distance[i] < minValue && (!visitied[i]) {
                minValue = distance[i]
                index = i
            }
        }
        return index
    }
    
    distance[0] = 0
    visitied[0] = true
    for info in arr[0] {
        let destination = info[0]
        let value = info[1]
        distance[destination] = value
    }
    for i in 0...n {
        let currentShort = getShortDistance()
        visitied[currentShort] = true
        for j in arr[currentShort] {
            let cost = distance[currentShort] + j[1]
            if cost < distance[j[0]] {
                distance[j[0]] = cost
            }
        }
    }

    let index = words.firstIndex(of: target) ?? -1
    if index == -1 { return 0 }
   
    return distance[index + 1]
}

print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
