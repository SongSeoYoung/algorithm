import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let length = lock.count //자물쇠의 길이 파악
    let keyLen = key.count  //key의 길이 파악
    var newLock = Array(repeating: Array(repeating: 0, count: length * 3), count: length * 3)       //3배 크기의 새로운 자물쇠 만들고
    //가운데에 넣어주기
    for i in 0..<length {
        for j in 0..<length {
            newLock[i+length][j+length] = lock[i][j]
        }
    }
    //4가지 방향에 대해서
    for _ in 0..<4 {
        key = rotate90Degree(a: key)
        for i in 0...length * 2 {
            for j in 0...length * 2 {
                //자물쇠에 열쇠 넣어보기
                for h in 0..<keyLen {
                    for w in 0..<keyLen {
                        newLock[h+i][w+j] += key[h][w]
                    }
                }
                //모두 1인지 체크
                if checkOne(arr: newLock, lockLen: length) {
                    return true
                }
                else{
                    for y in 0..<keyLen {
                        for x in 0..<keyLen {
                            newLock[y+i][x+j] -= key[y][x]
                        }
                    }
                }
            }
        }
    }
    return false
}

func checkOne(arr: [[Int]], lockLen: Int) -> Bool {
    for i in lockLen..<lockLen * 2 {
        for j in lockLen..<lockLen * 2 {
            if arr[i][j] != 1 {
                return false
            }
        }
    }
    return true
}

func rotate90Degree(a: [[Int]]) -> [[Int]] {
    let height = a.count     //height 길이
    let width = a[0].count  // width 길이
    
    var result = Array(repeating: Array(repeating: 0, count: width), count: height)
    for i in 0..<height {
        for j in 0..<width {
            result[j][height - i - 1] = a[i][j]
        }
    }
    return result
}

//print(solution([[0, 0, 0], [1, 0, 0], [0, 1, 1]]    , [[1, 1, 1], [1, 1, 0], [1, 0, 1]]))
