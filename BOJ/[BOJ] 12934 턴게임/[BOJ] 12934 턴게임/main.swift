//
//  main.swift
//  [BOJ] 12934 턴게임
//
//  Created by 송서영 on 2021/09/02.
//

import Foundation

func solution() {
    let info = readLine()!.split(separator: " ").map { UInt64(String($0))! }
    let x = info[0]
    let y = info[1]
    let _sum: UInt64 = x + y
    
    var sum: UInt64 = 1
    var count: UInt64 = 2
    var found:Bool = false
    while sum <= _sum {
        if sum == 1 && _sum == 1 {
            found = true
            break
        }
        sum += count
        if sum == _sum {
            found = true
            break
        }
        count += 1
    }
    
    
    var minimum: UInt64 = 0
    var minimumCount:UInt64 = 0
    if x == 0 && y == 0 { print (0) }
    else if !found {
        print(-1)
    }
    else if found {
        while minimum < x {
            minimum += count
            count -= 1
            minimumCount += 1
        }
        print(minimumCount)
    }
}

solution()
