func solution () {
    var info = readLine()!.split(separator: " ").map { Int(String($0))! }
    var arr = Array(repeating: Array(repeating: 987654321, count: info[0]), count: info[0])
    for i in 0..<info[1] {
        let list = readLine()!.split(separator: " ").map { Int(String($0))! }
        //양방향 플로이드와샬일 경우 한방향이면 하나만 적어주면됨.
        arr[list[0]-1][list[1]-1] = 1
        arr[list[1]-1][list[0]-1] = 1
    }
    
    let target = readLine()!.split(separator: " ").map { Int(String($0))! }
    for i in 0..<info[0] {
        arr[i][i] = 0
    }
    
    //플로이드와샬 테이블 채우기
    for i in 0..<info[0] {      //들렸다가는 경우의 수 체크
        for y in 0..<info[0] {      //y축
            for x in 0..<info[0] {      //x축
                //arr[y][x] = min(arr[y][x], i번째 노드에 들렸다가가 가기)
                arr[y][x] = min(arr[y][x], arr[y][i] + arr[i][x])
            }
        }
    }
   
    print(arr[1][target[1]-1] + arr[target[1]-1][target[0]-1])
}

solution()

/*
 5 7
 1 2
 1 3
 1 4
 2 4
 3 4
 3 5
 4 5
 4 5
 */
