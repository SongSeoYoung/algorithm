//
//  main.swift
//  [BOJ] 10816 숫자카드2
//
//  Created by 송서영 on 2021/06/02.
//

import Foundation

func solution() {
    let _ = Int(readLine()!)!
    let nArr = readLine()!.split(separator: " ").map { Int(String($0))! }
    var dic = [Int: Int]()
    for i in 0..<nArr.count {
        if dic[nArr[i]] == nil {
            dic.updateValue(1, forKey: nArr[i])
        } else {
            dic.updateValue(dic[nArr[i]]! + 1, forKey: nArr[i])
        }
    }
    let _ = Int(readLine()!)!
    let mArr = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var answer = [Int]()
    for i in 0..<mArr.count {
        if dic[mArr[i]] == nil {
            answer.append(0)
        }else {
            answer.append(dic[mArr[i]]!)
        }
    }
    for a in answer {
        print(a, terminator: " ")
    }
}
solution()
