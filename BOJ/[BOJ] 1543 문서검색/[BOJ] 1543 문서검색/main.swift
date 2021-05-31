//
//  main.swift
//  [BOJ] 1543 문서검색
//
//  Created by 송서영 on 2021/05/31.
//

import Foundation

func solution() {
    let target = Array(readLine()!).map { String($0) }
    let word = Array(readLine()!).map { String($0) }
    var dp:[Int] = Array(repeating: 0, count: target.count)
    for start in 0..<target.count {
        var i = start
        while true {
            if i >= target.count { break }
            if target[i] == word[0] {
                if i + word.count - 1 < target.count {
                    if Array(target[i...word.count + i - 1]) == word {
                        dp[start] += 1
                        i += word.count
                    } else { i += 1 }
                } else { i += 1 }
            } else { i += 1 }
        }
    }
    print(dp.max()!)
}

solution()
