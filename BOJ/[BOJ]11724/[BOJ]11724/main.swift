//
//  main.swift
//  [BOJ]11724
//
//  Created by 송서영 on 2021/01/13.
//

import Foundation


let node = readLine()!.split(separator: " ").map{ Int($0)! }
var arr : [[Int]] = Array(repeating: Array(repeating: 0, count: node[0]), count: node[0])
for i in 0..<node[0]{
    arr[i][i] = 1
}
var starting: Int = 1
for i in 0..<node[1]{
    let number = readLine()!.split(separator: " ").map{ Int($0)! }
    if i == 0 {
        starting = number[0]
    }
    arr[number[0] - 1][number[1] - 1 ] = 1
    arr[number[1] - 1 ][number[0] - 1] = 1
}

var bfsCounting: Int = 0
var visited: [Int] = []
func bfs(_ start: Int){
    bfsCounting = bfsCounting + 1
    visited.append(start)
    var check: [Int] = [start]
    while !check.isEmpty {
        let small = check.popLast()!
        arr[small - 1][small - 1] = 0
        for i in 0..<node[0]{
            if i == small - 1 && arr[small - 1][i] == 1 {
                bfsCounting = bfsCounting + 1
                arr[small - 1][small - 1] = 0
            }
            if arr[small - 1][i] == 1 && !(visited.contains(i + 1)) {
                visited.append(i + 1)
                check.append(i + 1)
                arr[small - 1][i] = 0
                arr[i][small - 1] = 0

            }
            if arr[small - 1][i] == 1 && (visited.contains(i + 1)) {
                arr[small - 1][i] = 0
                arr[i][small - 1] = 0
            }
        }
    }
}
bfs(starting)
var result: Int = 0
for i in 0..<node[0]{
    if arr[i].contains(1) {
        bfs(i + 1)
    }else{
        continue
    }
}
print(bfsCounting)
